import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../ResponseMsg/CustomResponse.dart';
import '../../Services/Supabase/supabaseEnv.dart';

verificatioEmail(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    await SupaBaseEnv().supabase.auth.verifyOTP(
          token: body['otp'],
          type: OtpType.signup,
          email: body['email'],
        );

    return CustomResponse().successResponse(msg: "email is confirm");
  } catch (error) {
    print(error);

    return CustomResponse().errorResponse(
      msg: "email not confirm",
    );
  }
}
