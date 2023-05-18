import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../ResponseBOX/customResponse.dart';
import '../Services/supabaseENV.dart';


//in postman enter
//"email" : "****@gmail.com"
//"password" : "******"
//"new_password" : "*****"


ResetPass(Request req) async {
  try {
     //read the data from postman
    final body = json.decode(await req.readAsString());
    final supabaseVriable = supabaseENV().supabase.auth;



//sign in first , then take the email to reset password 
    await supabaseVriable.signInWithPassword(
        email: body['email'], password: body['password']);

    await supabaseVriable.resetPasswordForEmail(
      body["email"],
     // redirectTo: 'https://mail.google.com/',
    );


//take new password to update user info
    await supabaseVriable.updateUser(
      UserAttributes(password: body["new_password"]),
    );




//if the prosses sucess go to sucessResponse Response with msg and statusCode 
////if the prosses fail go to errorResponse Response with msg and statusCode
    return customResponse().sucessResponse(msg: "reset response ");
  } catch (e) {
    print(e);

    return customResponse().errorResponse(msg: "oops! something wrong!");
  }
}


