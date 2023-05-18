import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../RespnseMag/CustomResponse.dart';
import '../../Services/Supabase/SupabaseEnv.dart';

changeEmailResponse(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    final supabaseVariable = SupabaseEnv().supabase.auth;

    if (!body.containsKey('email') || !body.containsKey('newEmail')) {
      return CustomResponse().errorResponse(msg: 'Missing email or new Email');
    }
    await supabaseVariable.signInWithPassword(
        email: body['email'], password: body['password']);

    
    await supabaseVariable.updateUser(
      UserAttributes(email: body['newEmail']),
    );

    await SupabaseEnv().supabase.from("users").update( {"email": body["new_email"],
    }).eq("email", body["email"],);


    return CustomResponse()
        .successResponse(msg: "email updated successfully!");
  } catch (e) {
    return CustomResponse()
        .errorResponse(msg: "There was an error updating your email.");
  }
}
