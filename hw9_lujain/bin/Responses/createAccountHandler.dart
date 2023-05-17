// ignore_for_file: file_names

import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';
import '../env/SupaBaseEnv.dart';

createAccountHandler(Request req) async {
  try {
    var supaBaseVar = SupaBaseEnv().supaBaseHandler;
    final body = json.decode(await req
        .readAsString()); //Validate the request body to ensure all required fields are provided
    UserResponse userAccount =
        await supaBaseVar.auth.admin.createUser(AdminUserAttributes(
      email: body['email'],
      password: body['password'],
    ));

    await supaBaseVar.from('users').insert({
      "email": body["email"],
      "id_auth": userAccount.user?.id,
    }); //Store the user's account information

    await supaBaseVar.auth.signInWithOtp(
      email: body["email"],
    );

    return Response.ok(
      "create account successfully",
    ); //Return an appropriate response indicating the success of the account creation process
  } catch (e) {
    print(e);

    return Response.badRequest(
      body: "Something wrong....",
    ); //Return an appropriate response indicating the failure of the account creation process
  }
}
