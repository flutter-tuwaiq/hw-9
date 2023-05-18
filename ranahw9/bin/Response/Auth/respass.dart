import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../ResponseMsg/CustomResponse.dart';
import '../../Services/Supabase/supabaseEnv.dart';

resetPass(Request req) async {
  try {
    final body = json.decode(await req.readAsString());

    if (body.keys.toString() != "(email, current_password, new_password)") {
      return CustomResponse().errorResponse(
        msg: "enter your email, old and new password.",
      );
    }
    final supabaseVariable = SupabaseEnv().supabase;

    await supabaseVariable.auth.signInWithPassword(
      email: body["email"],
      password: body["current_password"],
    );

    await supabaseVariable.auth.resetPasswordForEmail(
      body['email'],
      redirectTo: "http://0.0.0.0:9999/auth/reset_password",
    );

    await supabaseVariable.auth.updateUser(UserAttributes(
      // email: body['email'],
      password: body['new_password'],
    ));

    return CustomResponse()
        .successResponse(msg: "Your password has been updated successfully!");
  } catch (error) {
    print(error);

    return CustomResponse()
        .errorResponse(msg: "Something went wrong,try again.");
  }
}
