import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../ResponseMsg/CustomResponse.dart';
import '../../Services/Supabase/supabaseEnv.dart';

resetPasswordResponse(Request req) async {
  try {
    final Map body = jsonDecode(await req.readAsString());

    // check if user enter all data
    if (body.keys.toString() != "(email, current_password, new_password)") {
      return CustomResponse().errorResponse(
        msg: "sorry! enter your email and current , new password",
      );
    }

    // get supabase from class SupabaseEnv()
    final supabase = SupabaseEnv().supabase;

    // login first then reset password
    await supabase.auth.signInWithPassword(
      email: body["email"],
      password: body["current_password"],
    );

    // send a reset password email to user
    await supabase.auth.resetPasswordForEmail(body["email"]);

    // update the new password
    await supabase.auth.updateUser(
      UserAttributes(password: body["new_password"]),
    );

    // ------ success ------
    return CustomResponse().successResponse(
      msg: "update password successfully",
    );
  } catch (error) {
    // ------ error ------
    print(error);

    return CustomResponse().errorResponse(msg: " Please try again..");
  }
}
