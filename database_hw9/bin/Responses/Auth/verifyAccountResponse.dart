import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../ResponseMsg/CustomResponse.dart';
import '../../Services/Supabase/supabaseEnv.dart';

verifyAccountResponse(Request req) async {
  try {
    final Map body = jsonDecode(await req.readAsString());

    // check if user enter email and otp
    if (body.keys.toString() != "(email, otp)") {
      return CustomResponse().errorResponse(
        msg: "Dear user, please enter your email and verification code",
      );
    }

    await SupabaseEnv().supabase.auth.verifyOTP(
          token: body["otp"],
          type: OtpType.signup,
          email: body["email"],
        );

    // ------ success ------
    return CustomResponse().successResponse(msg: "Your account is confirm");
  } catch (e) {
    // ------ error ------
    return CustomResponse().errorResponse(msg: "Not confirm! Try again");
  }
}
