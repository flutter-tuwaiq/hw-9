// ignore_for_file: file_names

import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';
import '../env/SupaBaseEnv.dart';

resetPasswordHandler(Request req) async {
  try {
    var supaBaseVar = SupaBaseEnv().supaBaseHandler;
    final body = json.decode(await req
        .readAsString()); //Validate the request body to ensure all required fields are provided

    await supaBaseVar.auth.signInWithPassword(
      email: body['email'],
      password: body['password'],
    );
    await supaBaseVar.auth.resetPasswordForEmail(body[
        'email']); //Verify the provided email against the registered email in Supabase.
    await supaBaseVar.auth
        .updateUser(UserAttributes(password: body['new_password']));

    return Response.ok(
      "reset password successfully",
    );
  } catch (e) {
    print(e);

    return Response.badRequest(
      body: "Your password is incorrect, please try again.",
    );
  }
}
