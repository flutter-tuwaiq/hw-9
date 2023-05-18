import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../RespnseMag/CustomResponse.dart';
import '../../Services/Supabase/SupabaseEnv.dart';

restPasswordResponse(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    final supabaseVariable = SupabaseEnv().supabase.auth;

    if (!body.containsKey('email') || !body.containsKey('Password')) {
      return CustomResponse().errorResponse(msg: 'Missing email or new Email');
      }

    await supabaseVariable.signInWithPassword(
        email: body['email'], password: body['password']);
        

    await supabaseVariable.resetPasswordForEmail(
      UserAttributes(email: body['email']) as String,
    );

    
    await SupabaseEnv().supabase.from("users").update({
      "password": body["newPassword"],
    }).eq('email', body["email"]);

    await SupabaseEnv()
        .supabase
        .from("users")
        .update({"password": body["newPassword"]});
    

    return CustomResponse()
        .successResponse(msg: "Password updated successfully!");
  } catch (e) {
    return CustomResponse()
        .errorResponse(msg: "There was an error updating your password.");
  }
}
