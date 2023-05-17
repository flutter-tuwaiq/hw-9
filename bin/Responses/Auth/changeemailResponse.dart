// ignore_for_file: file_names, depend_on_referenced_packages

import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../Services/supaBase.dart';
import '../../env/customMsg.dart';

changeemailResponse(Request req) async {
  try {
    final body = jsonDecode(await req.readAsString());
    final supaClient = supaBase().supabase;
    final stringBody = body.toString();

    if (!stringBody.contains('email') ||
        !stringBody.contains('password') ||
        !stringBody.contains('newEmail')) {
      return customMsg()
          .badReqResponse(msg: 'please enter the email and passwords');
    }
    if (body['email'] == '' ||
        body['password'] == '' ||
        body['newEmail'] == '') {
      return customMsg()
          .badReqResponse(msg: 'please enter the email and passwords');
    }

    //login to update email
    await supaClient.auth
        .signInWithPassword(email: body['email'], password: body['password']);

    //update email on auth
    await supaClient.auth.updateUser(UserAttributes(email: body['newEmail']));

    //update email on users table
    await supaClient
        .from("users")
        .update({"email": body["newEmail"]}).eq('email', body['email']);

    // signout
    await supaClient.auth.signOut();

    return customMsg().successResponse(msg: "email updated");
  } catch (error) {
    return customMsg().badReqResponse(msg: "failed to update email");
  }
}
