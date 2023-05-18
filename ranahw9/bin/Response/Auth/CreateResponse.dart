import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../ResponseMsg/CustomResponse.dart';
import '../../Services/Supabase/supabaseEnv.dart';

import 'dart:io';

CreateResponse(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    print(body);

    final supbaseVariable = SupabaseEnv().supabase.auth;

    UserResponse userInfo = await supbaseVariable.admin.createUser(
      AdminUserAttributes(email: body['email'], password: body['password']),
    );

    await supbaseVariable.signInWithOtp(email: body['email']);
    await SupabaseEnv()
        .supabase
        .from("users")
        .insert({"email": body['email'], "id_auth": userInfo.user?.id});

    return CustomResponse().successResponse(
      msg: "create account",
      data: [
        {"email": body['email']}
      ],
    );
  } catch (error) {
    print("error");

    return CustomResponse().errorResponse(
      msg: "sorry you should have a body",
    );
  }
}
