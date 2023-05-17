import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../ResponseMsg/CustomResponse.dart';
import '../../Services/Supabase/supabaseEnv.dart';

changeEmailResponse(Request req) async {
  try {
    final Map body = jsonDecode(await req.readAsString());

    // check if user enter all data
    if (body.keys.toString() != "(email, password, new_email)") {
      return CustomResponse().errorResponse(
        msg: "sorry! enter your email , password and new email",
      );
    }

    // get supabase from class SupabaseEnv()
    final supabase = SupabaseEnv().supabase;

    // login first then change email
    await supabase.auth.signInWithPassword(
      email: body["email"],
      password: body["password"],
    );

    // update the new email
    await supabase.auth.updateUser(
      UserAttributes(email: body["new_email"]),
    );

    await supabase
        .from("users")
        .update({"email": body["new_email"]}).eq("email", body["email"]);

    // ------ success ------
    return CustomResponse().successResponse(
      msg: "update email successfully",
    );
  } catch (error) {
    // ------ error ------
    print(error);

    return CustomResponse().errorResponse(msg: " Please try again...");
  }
}
