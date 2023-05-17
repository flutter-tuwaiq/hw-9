// ignore_for_file: file_names, depend_on_referenced_packages

import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../Services/supaBase.dart';
import '../../env/customMsg.dart';

signupResponse(Request req) async {
  try {
    final body = jsonDecode(await req.readAsString());
    final stringBody = body.toString();
    final supaClient = supaBase().supabase;

    if (!stringBody.contains('email') || !stringBody.contains('password')) {
      return customMsg().badReqResponse(msg: 'please enter email and password');
    }
    if (body['email'] == '' || body['password'] == '') {
      return customMsg().badReqResponse(msg: 'please enter email and password');
    }
    // Create user account
    UserResponse account = await supaClient.auth.admin.createUser(
      AdminUserAttributes(email: body['email'], password: body['password']),
    );

    // Send verify by email
    await supaClient.auth.signInWithOtp(email: body['email']);

    await supaClient.from('users').insert({
      'email': body['email'],
      'password': body['password'],
      'id_auth': account.user?.id,
    });

    return customMsg().successResponse(msg: "account created", data: [
      {'email': body['email']},
    ]);
  } catch (error) {
    return customMsg().badReqResponse(msg: "failed while signing up..");
  }
}
