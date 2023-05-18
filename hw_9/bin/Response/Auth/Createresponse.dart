

import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../ResponseMsg.dart/CustomResponse.dart';
import '../../Servaces/Supabase/SuoabaseEnv.dart';

Createresponse(Request request)async{

  try{
      // Create a body variable and convert it to json

      final body = json.decode(await request.readAsString());

      print(body);
      // create subaEvn Varibles to deal with it more than one time

      final subaEvn = SuoabaseEnv().supabase;

      // create supabaseVaribles Varibles to deal with it more than one time
      final supabaseVaribles = subaEvn.auth;

      // create user

      UserResponse userInfo = await supabaseVaribles.admin.createUser(
        AdminUserAttributes(email: body["email"] , password: body["password"]),

      );

      //request for users
      await supabaseVaribles.signInWithOtp(email: body["email"]);

      // send to the table data (users)
      await subaEvn
      .from("users")
      .insert({"email" : body["email"] , "id_auth" : userInfo.user?.id});

      // coall to successResponse mathode 
      return CustomResponse().successResponse(msg: "create account page" , data: [{"email" : body["emaile"]}]);


  }catch(error){
    print(error);
    
    // coall to errorResponse mathode 
    return CustomResponse().errorResponse(msg: "sorry you should have body");
  }

} 