


import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../ResponseMsg.dart/CustomResponse.dart';
import '../../Servaces/Supabase/SuoabaseEnv.dart';

verifyEmailResponse(Request request)async{

  try{
    
    // Create a body variable and convert it to json

    final body = json.decode(await request.readAsString());

    print(body);

    // verify emaile for otp code 
    await SuoabaseEnv().supabase.auth.verifyOTP(token: body["otp"], type: OtpType.signup , email: body["email"]);

    // caoll the successResponse methode to disbly succsses massage
    return CustomResponse().successResponse(msg: "emaile is confirm");


  }
  
  catch(error){
    print(error);

    // caoll the errorResponse methode to disbly error massage
    return CustomResponse().errorResponse(msg: "email is not confirm");

  }

}