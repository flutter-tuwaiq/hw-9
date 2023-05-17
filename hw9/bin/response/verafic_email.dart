import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../msg/create_response.dart';
import '../supabase_env.dart';

veraficEmail(Request req) async {
  try{
    final body = json.decode(await req.readAsString());
    await SupabaseEnv().supabase.auth.verifyOTP(token: body['otp'], type: OtpType.signup,email: body['email']);
    
    return CreateResponse().successResponse(msg: 'verified');
  }catch(error){
return CreateResponse().errorResponse(msg: "error");
  }
}