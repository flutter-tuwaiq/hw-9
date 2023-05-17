import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';
import '../response_msgs/bad_req_res.dart';
import '../response_msgs/ok_res.dart';
import '../services/supabase/supabase_env.dart';

Future<Response> createAccountHandler(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    final supabase = SupabaseEnv().supabase;

    UserResponse userInfo = await supabase.auth.admin.createUser(
      AdminUserAttributes(email: body["email"], password: body["password"]),
    );

    await supabase.from("users").insert({
      "email": body["email"],
      "password": body["password"],
      "auth_id": userInfo.user?.id,
    });

    await supabase.auth.signInWithOtp(
      email: body["email"],
    );

    return OkRes().okResponse(
      msg: "Account created! you will recive an email to confirm your account.",
    );
  } catch (e) {
    print(e);

    return BadReqRes().errorResponse(msg: "error");
  }
}
