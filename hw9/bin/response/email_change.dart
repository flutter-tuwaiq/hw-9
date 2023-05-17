import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../msg/create_response.dart';
import '../supabase_env.dart';

emailChange(Request req) async {
  try{
    final body = json.decode(await req.readAsString());
    final supavaribale =SupabaseEnv().supabase;
    await supavaribale.auth.updateUser(body['email']);
    await supavaribale.from('users').update({'email':body['email']});

    return CreateResponse().successResponse(msg: "email changed", data: [{'email':body['email']}],);
  }catch(error){
return CreateResponse().errorResponse(msg: "something went wrong");
  }
}