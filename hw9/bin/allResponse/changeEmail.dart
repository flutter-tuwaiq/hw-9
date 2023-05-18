import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../ResponseMsg/CustomResponse.dart';
import '../services/SupabaseEnv.dart';

changeEmail(Request req) async {
  try{
    final body = json.decode(await req.readAsString());
    final supavaribale =SupabaseEnv().supabase;
    await supavaribale.auth.updateUser(body['email']);
    await supavaribale.from('users').update({'email':body['email']});

    return CustomResponse().successResponse(msg: "email changed", data: [{'email':body['email']}],);
  }catch(error){
return CustomResponse().errorResponse(msg: "something went wrong");
  }
}