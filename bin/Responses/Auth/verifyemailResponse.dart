// ignore_for_file: file_names, depend_on_referenced_packages

import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../Services/supaBase.dart';
import '../../env/customMsg.dart';

verifyemailResponse(Request req) async {
  try {
    final body = jsonDecode(await req.readAsString());
    final stringBody = body.toString();

    if (!stringBody.contains('email') || !stringBody.contains('otp')) {
      return customMsg().badReqResponse(msg: 'please enter email and otp');
    }
    if (body['email'] == '' || body['password'] == '') {
      return customMsg().badReqResponse(msg: 'please enter email and otp');
    }

    // verify email otp
    await supaBase().supabase.auth.verifyOTP(
          token: body['otp'],
          type: OtpType.signup,
          email: body['email'],
        );

    return customMsg().successResponse(msg: 'email verified...');
  } catch (error) {
    return customMsg().badReqResponse(msg: "failed to confirm");
  }
}
