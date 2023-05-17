import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../msg/create_response.dart';
import '../supabase_env.dart';

passwordRest(Request req) async {
  try{
    final body = json.decode(await req.readAsString());
    final supavaribale =SupabaseEnv().supabase.auth;
    String email =body['email'];
    await supavaribale.resetPasswordForEmail(email);
    // await supavaribale.from('users').update({'password':body['password']});
    // await supavaribale.auth.updateUser(body['password']);

    return CreateResponse().successResponse(msg: "check your Email", data: [{'email':body['email']}],);
  }catch(error){
return CreateResponse().errorResponse(msg: "something went wrong");
  }
}