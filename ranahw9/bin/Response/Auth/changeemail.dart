import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../ResponseMsg/CustomResponse.dart';
import '../../Services/Supabase/supabaseEnv.dart';

changeEmail(Request req) async {
  try {
    final body = json.decode(await req.readAsString());

    if (body.keys.toString() != "(email, new_email, password)") {
      return CustomResponse().errorResponse(
        msg: "Please enter your email and password.",
      );
    }
    final supabaseVariable = SupabaseEnv().supabase;

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

    return CustomResponse()
        .successResponse(msg: "Your password has been updated successfully!");
  } catch (error) {
    print(error);

    return CustomResponse()
        .errorResponse(msg: "Something wrong happend, please try again.");
  }
}
