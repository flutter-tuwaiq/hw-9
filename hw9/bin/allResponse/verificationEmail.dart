import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';
import '../ResponseMsg/CustomResponse.dart';
import '../services/SupabaseEnv.dart';

verificationEmail(Request req) async {
  try {
    final Map body = jsonDecode(await req.readAsString());
await SupabaseEnv().supabase.auth.verifyOTP(
  token: body['OTP'],type: OtpType.signup,email: body['email'],
);    
    return CustomResponse().successResponse(msg: "Your account is confirm");
  } catch (e) {
    return CustomResponse().errorResponse(msg: "Not confirm! Try again");
  }
}
