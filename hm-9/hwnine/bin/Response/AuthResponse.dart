import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../Service/SupaBaseEnv.dart';

createResponse(Request request) async {

    try {

          final  body = json.decode(await request.readAsString());

          if (body["email"] == "" || body["password"] == "")
           {
               return Response(400, body: 'Missing email or password');
           } 

           await SupaBaseEnv().supaBase.auth.admin.createUser(
              AdminUserAttributes(email: body["email"],password:body["password"]),  
            );

          return Response.ok("Done");

    } catch (e) {
      return Response.badRequest(body: "Check the input format   ");
    }
}



verifyResponse(Request request) async {

    try {

          final  body = json.decode(await request.readAsString());

          if (body["email"] == "" || body["password"] == "")
           {
               return Response(400, body: 'Missing email or password');
           } 
          final SupaBaseVaribal = SupaBaseEnv().supaBase.auth;

          UserResponse userInfo = await SupaBaseVaribal.admin.createUser(
              AdminUserAttributes(email: body["email"],password:body["password"]),  
            );

              await SupaBaseVaribal.signInWithOtp(email: body["email"]);

              await SupaBaseEnv().supaBase
                  .from("users")
                  .insert({"email":body["email"] , "id_auth":userInfo.user?.id});

          return Response.ok("Done");

    } catch (e) {
      return Response.badRequest(body: "Check the input format");
    }

}


emailChange(Request request) async {

    try {

          final  body = json.decode(await request.readAsString());
          final SupaBaseVaribal = SupaBaseEnv().supaBase;

          if (body["email"] == "" || body["password"] == "" || body["newEmail"] == "")
           {
               return Response(400, body: 'Missing some input');
           } 

             try {
              await SupaBaseVaribal.auth.signInWithPassword(
              email: body["email"],
              password: body["password"],
            );
             } catch (e) {
               return Response.badRequest(body: "Incorrect email or password");
             }

            await SupaBaseVaribal.auth.updateUser(
              UserAttributes(email: body["newEmail"]),
            );

            await SupaBaseVaribal
                .from("users")
                .update({"email": body["newEmail"]})
                .match({"email": body["email"]});

          return Response.ok("Email Changed");

    } catch (e) {

      return Response.badRequest(body: "Check the input format");
    }

}


resetPasswor(Request request) async {


    try {

          final  body = json.decode(await request.readAsString());
          final SupaBaseVaribal = SupaBaseEnv().supaBase;

          if (body["email"] == "" || body["password"] == "" || body["newPassword"] == "")
           {
               return Response(400, body: 'Missing some input');
           } 

           try {
              await SupaBaseVaribal.auth.signInWithPassword(
              email: body["email"],
              password: body["password"],
            );
             } catch (e) {

               return Response.badRequest(body: "Incorrect email or password");
             }

            await SupaBaseVaribal.auth.resetPasswordForEmail(body["email"]);

            await SupaBaseVaribal.auth.updateUser(
              UserAttributes( password: body["newPassword"]
              ));

          return Response.ok("password Changed");

    } catch (e) {

      return Response.badRequest(body: "Check the input format");
    }

}