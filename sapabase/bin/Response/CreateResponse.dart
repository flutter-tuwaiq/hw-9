import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../ResponseMsg/CustomResponse.dart';
import '../Services/supabase/supabaseEnv.dart';

createResponse(Request req) async {
  try {
    final Map<String, dynamic> body = jsonDecode(await req.readAsString());

    // check if user enter all registration info
    if (body.keys.toString() != "(email, password, first_name)") {
      return CustomResponse().errorResponse(
        msg: "I think you forgot your email, password or first name!",
      );
    }

    // get supabase from class SupabaseEnv()
    final supabase = supabaseEnv().supabase;

    UserResponse userInfo = await supabase.auth.admin.createUser(
      AdminUserAttributes(
        email: body['email'],
        password: body['password'],
      ),
    );

    await supabase.auth.signInWithOtp(email: body["email"]);

    await supabase.from("users").insert({
      "email": body["email"],
      "first_name": body["first_name"],
      "id_auth": userInfo.user?.id,
    });

    return CustomResponse().successResponse(
      msg: "Your account has been created successfully",
      data: body,
    );
  } catch (e) {
    return CustomResponse()
        .errorResponse(msg: "There is something wrong! could you try again..");
  }
}
