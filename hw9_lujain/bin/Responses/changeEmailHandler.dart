// ignore_for_file: file_names

import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';
import '../env/SupaBaseEnv.dart';

changeEmailHandler(Request req) async {
  try {
    var supaBaseVar = SupaBaseEnv().supaBaseHandler;
    final body = json.decode(await req
        .readAsString()); //Validate the request body to ensure all required fields are provided

    await supaBaseVar.auth.signInWithPassword(
      email: body['email'],
      password: body['password'],
    );
    await supaBaseVar.auth.updateUser(UserAttributes(
      email: body['new_email'],
    )); //Verify the provided email against the registered email in Supabase.

    await supaBaseVar.from('users').update({
      'email': body['new_email'],
    }).eq(
      'email',
      body['email'],
    ); //Update the account's email address with the new email address.

    return Response.ok(
      "Change email successfully",
    ); //Return an appropriate response indicating the success of the email change process.
  } catch (e) {
    print(e);

    return Response.badRequest(
      body: "Something wrong....",
    ); //Return an appropriate response indicating the failure of the email change process.
  }
}
