import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../Serves/Supabase/SupaBaseEnv.dart';
import '../../resMsg/CustomResponse.dart';

createRosposnse(Request req)async{

try {

final body = json.decode(await req.readAsString());
print(body);

final supabaseVeriable = SupaBaseEv().supabase.auth;
UserResponse userInfo = await supabaseVeriable.admin.createUser(
AdminUserAttributes(email : body["email"] , password :body ["password"]),);


await supabaseVeriable.signInWithOtp(email: body["email"]);
await SupaBaseEv().supabase.from("users").insert({"email" : body["email"] , "id_auth" : userInfo.user?.id});


return CustomResponse().successResponse(msg: " creat account page ",data:[
  {"email" : body["email"]}
],);

}catch(error){

print(error);
return CustomResponse().errorResponse(msg: "sorry you should have body");


}
}