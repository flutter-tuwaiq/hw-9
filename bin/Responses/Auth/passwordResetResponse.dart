// ignore_for_file: file_names, depend_on_referenced_packages

import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../Services/supaBase.dart';
import '../../env/customMsg.dart';

passwordResetResponse(Request req) async {
  try {
    final body = jsonDecode(await req.readAsString());
    final supaClient = supaBase().supabase;
    final stringBody = body.toString();

    if (!stringBody.contains('email') ||
        !stringBody.contains('password') ||
        !stringBody.contains('newpassword')) {
      return customMsg()
          .badReqResponse(msg: 'please enter the email and passwords');
    }
    if (body['email'] == '' ||
        body['password'] == '' ||
        body['newpassword'] == '') {
      return customMsg()
          .badReqResponse(msg: 'please enter the email and passwords');
    }

    //login to reset password
    await supaClient.auth
        .signInWithPassword(email: body['email'], password: body['password']);

    // //send a reset request via email
    await supaClient.auth.resetPasswordForEmail(body['email']);

    //reset password on auth
    await supaClient.auth
        .updateUser(UserAttributes(password: body['newpassword']));

    //reset password on users table
    await supaClient
        .from("users")
        .update({"password": body["newpassword"]}).eq('email', body['email']);

    // signout
    await supaClient.auth.signOut();

    return customMsg().successResponse(msg: 'updated password..');
  } catch (error) {
    return customMsg().badReqResponse(msg: 'failed to reset password');
  }
}
