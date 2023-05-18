import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';
import '../../ResponseMsg/CustomResponse.dart';
import '../../Services/Supabase/supabaseEnv.dart';

// This Response for creating A new acount.
creatResponse(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    print(body);

    final SubaBaseVariable = SupaBaseEnv().supabase.auth;
    UserResponse userInfo = await SubaBaseVariable.admin.createUser(
      AdminUserAttributes(email: body['email'], password: body['password']),
    );

    await SubaBaseVariable.signInWithOtp(email: body['email']);
    await SupaBaseEnv()
        .supabase
        .from("users")
        .insert({"email": body['email'], "id_auth": userInfo.user?.id});

    return CustomResponse().successResponse(
      msg: "creat account page",
      data: [
        {"email": body['email']},
      ],
    );
  } catch (error) {
    print(error);

    return CustomResponse().errorResponse(
      msg: "sorry you should have body",
    );
  }
}
