import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';
import '../../ResponseMsg.dart/CustomResponse.dart';
import '../../Servaces/Supabase/SuoabaseEnv.dart';

verifyPasswordResponse(Request req) async {
  try {
  
    // Create a body variable and convert it to json

    final body = json.decode(await req.readAsString());

    // create subaEvn Varibles to deal with it more than one time

    final supEvn = SuoabaseEnv().supabase;

    // sing in with email and password to confirm the email want to change is for user

    await supEvn.auth.signInWithPassword(
      email: body["email"],
      password: body["password"],
    );

    //create new email

    await supEvn.auth.updateUser(
      UserAttributes(password: body["new_password"]),
    );

    // save the new password in users table Replace the old password


    await supEvn.
    from("users").update({
      "password": body["new_password"],
    }).eq('email', body["email"]);

    // coall to successResponse mathode 


    return CustomResponse().successResponse(msg: "Check in you new email" , data: [{"email" : body["email"] , "new_email" : body["new_email"]}]);
  } catch (error) {
    print(error);

    // coall to errorResponse mathode 

    return CustomResponse().errorResponse(msg: "your email are not confirm");

  }
}