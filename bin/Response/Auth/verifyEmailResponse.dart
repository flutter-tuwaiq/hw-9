import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../RespnseMag/CustomResponse.dart';
import '../../Services/Supabase/SupabaseEnv.dart';

verificatinEmail(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    await SupabaseEnv().supabase.auth.verifyOTP(
          token: body['OTP'],
          type: OtpType.signup,
          email: body['email'],
        );
        
return CustomResponse().successResponse(msg: "email is confirm");
  } catch (e) {
    return CustomResponse().errorResponse(msg: "email is not confirm");
  }
    
}
