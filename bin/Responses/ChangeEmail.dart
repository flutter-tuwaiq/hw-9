import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../ResponseMsg/ResponseMsg.dart';
import '../Supabase/supabase.dart';

changeEmail(Request req) async {
  try {
    final body = json.decode(await req.readAsString());

    if (body.keys.toString() != "(email, new_email, password)") {
      return ResponseMsg().errorResponse(
        msg: "Please enter your email and password.",
      );
    }
    final supabaseVariable = Supabase().supabase;

    await supabaseVariable.auth.signInWithPassword(
      email: body["email"],
      password: body["password"],
    );

    await supabaseVariable.auth.resetPasswordForEmail(body['email']);

    await supabaseVariable.auth
        .updateUser(UserAttributes(email: body['new_email']));

    await supabaseVariable
        .from("users")
        .update({"email": body["new_email"]}).eq("email", body["email"]);

    return ResponseMsg()
        .successResponse(msg: "Your password has been updated successfully!");
  } catch (error) {
    print(error);

    return ResponseMsg()
        .errorResponse(msg: "Something wrong happend, please try again.");
  }
}
