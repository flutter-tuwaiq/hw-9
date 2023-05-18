import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../Response/CustomResponse.dart';
import '../Services/supabase/supabaseEnv.dart';

changeEmailResponse(Request req) async {
  try {
    final Map body = jsonDecode(await req.readAsString());

    if (body.keys.toString() != "(email, password, new_email)") {
      return CustomResponse().errorResponse(
        msg: "sorry! enter your email , password and new email",
      );
    }

    final supabase = supabaseEnv().supabase;

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

    return CustomResponse().successResponse(
      msg: "update email successfully",
    );
  } catch (error) {
    print(error);

    return CustomResponse().errorResponse(msg: " Please try again...");
  }
}
