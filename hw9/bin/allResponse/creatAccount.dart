import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';
import '../ResponseMsg/CustomResponse.dart';
import '../services/SupabaseEnv.dart';

creatAccount(Request req) async {
  try{
    final body = json.decode(await req.readAsString());
    final supavaribale =SupabaseEnv().supabase;
   var userinfo=  await supavaribale.auth.admin.createUser(AdminUserAttributes(email: body['email'], password: body['passwprd']),);
    await supavaribale.auth.signInWithOtp(email: body['email']);
    await supavaribale.from('users').insert({
      'email':body['email'], 'id_auth': userinfo.user?.id,});

    return CustomResponse().successResponse(msg: "user created", data: [{'email':body['email']}],);
  }catch(error){
return CustomResponse().errorResponse(msg: "something went wrong");
  }
}
