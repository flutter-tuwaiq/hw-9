import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../ResponseBOX/customResponse.dart';
import '../Services/supabaseENV.dart';


//in postman enter
//"email" : "****@gmail.com"
//"otp" : "******"number from the email message



verification(Request req) async {
  try {
     //read the data from postman
    final body = json.decode(await req.readAsString());



    await supabaseENV().supabase.auth.verifyOTP(
          token: body["otp"],
          type: OtpType.signup,
          email: body["email"],
        );



//if the prosses sucess go to sucessResponse Response with msg and statusCode 
////if the prosses fail go to errorResponse Response with msg and statusCode
    return customResponse().sucessResponse(msg: "verfiy  !");
  } catch (e) {
    print(e);

    return customResponse().errorResponse(msg: "not verfiy");
  }
}
