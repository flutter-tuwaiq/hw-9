import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../ResponseMsg/CustomResponse.dart';
import '../../Services/Supabase/supabaseEnv.dart';

createAccount(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    print(body);
    final supabaseVariable = SupabaseEnv().supabase.auth;

    UserResponse userInfo = await supabaseVariable.admin.createUser(
      AdminUserAttributes(email: body["email"], password: body["password"]),
    );

    await supabaseVariable.signInWithOtp(
      email: body['email'],
    );

    await SupabaseEnv().supabase.from("users").insert({
      "email": body["email"],
      "id_auth": userInfo.user?.id,
    });

    return CustomResponse().successResponse(msg: "create account page", data: [
      {"email": body["email"]}
    ]);
  } catch (error) {
    print(error);

    return CustomResponse().errorResponse(
      msg: "A user with this email address has already been registered",
    );
  }
}
