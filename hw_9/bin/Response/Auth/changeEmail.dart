import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';
import '../../ResponseMsg/CustomResponse.dart';
import '../../Services/Supabase/supabaseEnv.dart';

changeEmail(Request req) async {
  try {
    final body = json.decode(await req.readAsString());

    final subaBaseVariable = SupaBaseEnv().supabase;
    await subaBaseVariable.auth.signInWithPassword(
      email: body["email"],
      password: body["password"],
    );

    await subaBaseVariable.auth.updateUser(
      UserAttributes(email: body["updated_email"]),
    );

    // await subaBaseVariable.auth.updateUser(body['email']);
    await subaBaseVariable.from("users").update({
      "email": body["updated_email"],
    }).eq(
      "email",
      body["email"],
    );

    return CustomResponse()
        .successResponse(msg: "Email changed succsessfuly. ");
  } catch (error) {
    print(error);

    return CustomResponse().errorResponse(
      msg: "Error !",
    );
  }
}
