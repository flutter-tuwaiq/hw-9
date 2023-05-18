import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import 'castomrespons.dart';
import 'subabaseenv.dart';

createResponse(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    print(body);

    final supabaseVariable = SupabaseEnv().supabase.auth;
    UserResponse userinfo = await supabaseVariable.admin.updateUserById(
        "mr.khushaim@gmail.com",
        attributes: AdminUserAttributes(
            email: body["email"], password: body["password"]));

    // await supabaseVariable.generateLink(
    //     email: body['email'], type: GenerateLinkType.magiclink);

    await supabaseVariable.signInWithOtp(
      email: body['email'],
    );
    await SupabaseEnv()
        .supabase
        .from("users")
        .insert({"email": body['email'], "id_auth": userinfo.user?.id});

    return CastomRespons().successResponse(msg: "create account page");
  } catch (error) {
    print(error);
    // return Response.badRequest("bad request");

    return CastomRespons().badRequest(
      msg: "sorry you should have body",
    ); // data is optional
  }
}
