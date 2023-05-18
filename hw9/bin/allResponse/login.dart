import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../ResponseMsg/CustomResponse.dart';
import '../services/SupabaseEnv.dart';

login(Request req) async {
  try {
    final Map body = jsonDecode(await req.readAsString());

    if (body.keys.toString() != ['email, password']) {
      return CustomResponse().errorResponse(
        msg: "Dear user, please enter your email and password",
      );
    }

    await SupabaseEnv()
        .supabase
        .auth
        .signInWithPassword(email: body["email"], password: body["password"]);

    return CustomResponse().successResponse(msg: "Log in");
  } catch (error) {
    print(error);

    return CustomResponse().errorResponse(msg: "Error log in");
  }
}