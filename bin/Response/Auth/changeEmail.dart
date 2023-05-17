import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../ResponseMsg/CustomResponse.dart';
import '../../Services/Supabase/supabaseEnv.dart';

changeEmail(Request req) async {
  try {
    final body = json.decode(await req.readAsString());

    if (!body.containsKey("newEmail")) {
      return CustomResponse().errorResponse(msg: "sorry please provide the new email ");
    } else if (!body.containsKey("email")) {
      return CustomResponse().errorResponse(msg: "sorry please provide the email ");
    } else if (!body.containsKey("password")) {
      return CustomResponse().errorResponse(msg: "sorry please provide the password ");
    }

    // await SupabaseEnv().supabase.auth.signInWithPassword(email: body["email"],password: body["password"]);
  
    await SupabaseEnv().supabase.auth.updateUser(UserAttributes(email: body["newEmail"]));
  
    await SupabaseEnv().supabase.from("users").update({"email": body["newEmail"]}).eq("email", body["email"]);
    
    return CustomResponse().successResponse(msg: "Successful email change");
  } catch (error) {
    print(error);
    return CustomResponse().errorResponse(msg: "Failed to change email");
  }
}