
import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';
import '../services/SupabaseEnv.dart';

resetPassword(Request req) async {
  try {
    var supaBaseVar = SupabaseEnv().supabase;
    final body = json.decode(await req
        .readAsString());
    await supaBaseVar.auth.signInWithPassword(
      email: body['email'],
      password: body['password'],
    );
    await supaBaseVar.auth.resetPasswordForEmail(body[
        'email']);
    await supaBaseVar.auth
        .updateUser(UserAttributes(password: body['new_password']));

    return Response.ok(
      "reset password successfully",
    );
  } catch (e) {
    print(e);

    return Response.badRequest(
      body: "incorrect(please try again).",
    );
  }
}