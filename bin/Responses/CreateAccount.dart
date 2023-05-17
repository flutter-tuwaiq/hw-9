import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../ResponseMsg/ResponseMsg.dart';
import '../Supabase/supabase.dart';

createAccount(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    final supabaseVariable = Supabase().supabase;

    UserResponse userInfo = await supabaseVariable.auth.admin.createUser(
      AdminUserAttributes(email: body['email'], password: body['password']),
    );

    await supabaseVariable.auth.signInWithOtp(email: body['email']);

    await supabaseVariable
        .from('users')
        .insert({'email': body['email'], 'id_auth': userInfo.user?.id});

    return ResponseMsg()
        .successResponse(msg: "Your account has been created succesfully!");
  } catch (error) {
    print(error);

    return ResponseMsg()
        .errorResponse(msg: "Something wrong happend, please try again.");
  }
}
