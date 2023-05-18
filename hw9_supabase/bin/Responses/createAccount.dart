import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../ResponseBOX/customResponse.dart';
import '../Services/supabaseENV.dart';



//in postman enter
//"email" : "****@gmail.com"
//"password" : "******"



createAccount(Request req) async {
  try {
     //read the data from postman
    final body = json.decode(await req.readAsString());
     final supabaseVriable = supabaseENV().supabase.auth;


//store the password and email to userinfo
     UserResponse userInfo = await supabaseVriable.admin.createUser(
      AdminUserAttributes(email : body['email'] , password : body['password']), 
     );

     //take the email and send otp num to the email
     await supabaseVriable.signInWithOtp(email:body['email']);

     //in supabase , from table users store email with id_auth (not null)
     await supabaseENV()
     .supabase
     .from("users")
     .insert({"email" : body["email"] , "id_auth":userInfo.user?.id});



     

//if the prosses sucess go to sucessResponse Response with msg and statusCode 
////if the prosses fail go to errorResponse Response with msg and statusCode
    return customResponse().sucessResponse(msg: "created yay !");
  } catch (e) {
    print(e);

    return customResponse().errorResponse(msg: "sorry you should have page");
  }
}
