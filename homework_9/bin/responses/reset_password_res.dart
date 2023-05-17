import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';
import '../response_msgs/bad_req_res.dart';
import '../response_msgs/ok_res.dart';
import '../services/supabase/supabase_env.dart';

Future<Response> resetPasswordHandler(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    final supabase = SupabaseEnv().supabase;

    await supabase.auth.signInWithPassword(
      email: body["email"],
      password: body["password"],
    );

    await supabase.auth.updateUser(
      UserAttributes(password: body["new_password"]),
    );

    await supabase.from("users").update({
      "password": body["new_password"],
    }).eq('email', body["email"]);

    return OkRes().okResponse(msg: "Password has been changed!");
  } catch (e) {
    print(e);

    return BadReqRes().errorResponse(msg: "Invalid data!");
  }
}
