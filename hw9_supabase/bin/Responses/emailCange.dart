import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../ResponseBOX/customResponse.dart';
import '../Services/supabaseENV.dart';

//in postman enter
//"email" : "****@gmail.com"
//"password" : "******"
//"new_email" : "*****@gmail.com"

emailChange(Request req) async {
  try {
    //read the data from postman
    final body = json.decode(await req.readAsString());
    final supabaseVriable = supabaseENV().supabase.auth;

//sign in first , then take the new email to update the user info
    await supabaseVriable.signInWithPassword(
        email: body["email"], password: body["password"]);

    await supabaseVriable.updateUser(
      UserAttributes(email: body["new_email"]),
    );

//to change the email in supabase , from table users change the email to the new one in the row that match the old email
    await supabaseENV()
        .supabase
        .from("users")
        .update({"email": body["changed_email"]}).eq("email", body["email"]);

//if the prosses sucess go to sucessResponse Response with msg and statusCode
////if the prosses fail go to errorResponse Response with msg and statusCode
    return customResponse().sucessResponse(msg: "email canged !");
  } catch (e) {
    print(e);

    return customResponse().errorResponse(msg: "sorry email not cahnged");
  }
}
