import 'dart:convert';
import 'package:shelf/shelf.dart';

import '../../ResponseMsg/CustomResponse.dart';
import '../../Services/Supabase/supabaseEnv.dart';

loginResponse(Request req) async {
  try {
    final Map body = jsonDecode(await req.readAsString());

    // check if user enter email and password
    if (body.keys.toString() != "(email, password)") {
      return CustomResponse().errorResponse(
        msg: "Dear user, please enter your email and password",
      );
    }

    //login
    await SupabaseEnv()
        .supabase
        .auth
        .signInWithPassword(email: body["email"], password: body["password"]);

    // ------ success ------
    return CustomResponse().successResponse(msg: "Log in");
  } catch (error) {
    // ------ error ------
    print(error);

    return CustomResponse().errorResponse(msg: "Error log in");
  }
}
