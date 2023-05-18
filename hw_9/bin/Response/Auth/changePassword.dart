import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../ResponseMsg/CustomResponse.dart';
import '../../Services/Supabase/supabaseEnv.dart';

changePassword(Request req) async {
  try {
    final body = json.decode(await req.readAsString());

    final subaBaseVariable = SupaBaseEnv().supabase;
    await subaBaseVariable.auth.signInWithPassword(
      email: body["email"],
      password: body["current_password"],
    );

    await subaBaseVariable.auth.resetPasswordForEmail(body['email']);
    await subaBaseVariable.auth.updateUser(
      UserAttributes(password: body["new_password"]),
    );

    await subaBaseVariable
        .from('users')
        .update({'password': body['new_password']});

    return CustomResponse()
        .successResponse(msg: "PASSWORD changed succsessfuly. ");
  } catch (error) {
    print(error);

    return CustomResponse().errorResponse(
      msg: "Sorry, Some thing went wrong :(",
    );
  }
}
