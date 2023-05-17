import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';
import '../response_msgs/bad_req_res.dart';
import '../response_msgs/ok_res.dart';
import '../services/supabase/supabase_env.dart';

Future<Response> changeEmailHandler(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    final supabase = SupabaseEnv().supabase;

    await supabase.auth.signInWithPassword(
      email: body["email"],
      password: body["password"],
    );

    await supabase.auth.updateUser(
      UserAttributes(email: body["new_email"]),
    );

    await supabase.from("users").update({
      "email": body["new_email"],
    }).eq(
      "email",
      body["email"],
    );

    return OkRes().okResponse(msg: "confirm email has been sent!");
  } catch (e) {
    print(e);

    return BadReqRes().errorResponse(msg: "Invalid data!");
  }
}
