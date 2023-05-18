import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../Serves/Supabase/SupaBaseEnv.dart';
import '../../resMsg/CustomResponse.dart';

verificationEmail(Request req) async{

try{


final body = json.decode(await req.readAsString());
 await SupaBaseEv().supabase.auth.verifyOTP(token: body['OTP'], type:OtpType.signup,
 email: body['email'],);
 return CustomResponse().successResponse(msg: "email is confirm");


}catch(e){
 return CustomResponse().successResponse(msg: "email is  not confirm");





}







}