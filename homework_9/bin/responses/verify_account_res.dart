import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';
import '../response_msgs/bad_req_res.dart';
import '../response_msgs/ok_res.dart';
import '../services/supabase/supabase_env.dart';

Future<Response> verifyAccountHandler(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    final supabaseAuth = SupabaseEnv().supabase.auth;
    supabaseAuth.verifyOTP(
      token: body["otp"],
      type: OtpType.signup,
      email: body['email'],
    );

    return OkRes().okResponse(msg: "Account verfied!");
  } catch (e) {
    print(e);

    return BadReqRes().errorResponse(msg: "error");
  }
}
