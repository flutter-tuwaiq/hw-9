import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../ResponseMsg/CustomResponse.dart';
import '../../Services/Supabase/supabaseEnv.dart';

resetPassword(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    if (!body.containsKey("newPassword")) {
      return CustomResponse().errorResponse(msg: "sorry please provide the new password ");
    } else if (!body.containsKey("email")) {
      return CustomResponse().errorResponse(msg: "sorry please provide the email ");
    } else if (!body.containsKey("oldPassword")) {
      return CustomResponse().errorResponse(msg: "sorry please provide the password ");
    }
    
    await SupabaseEnv().supabase.auth.signInWithPassword(email: body["email"],password: body["oldPassword"],);
    
    await SupabaseEnv().supabase.auth.updateUser(UserAttributes(password: body["newPassword"]));

    return CustomResponse().successResponse(msg: "Successful password reset");
  } catch (error) {
    print(error);
    return CustomResponse().errorResponse(msg: "Failed to reset password");
  }
}