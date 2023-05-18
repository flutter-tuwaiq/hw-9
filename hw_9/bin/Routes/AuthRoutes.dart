

import 'dart:ffi';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Response/Auth/ChangeEmaileResponse.dart';
import '../Response/Auth/Createresponse.dart';
import '../Response/Auth/verifyEmailResponse.dart';
import '../Response/Auth/verifyPasswordResponse.dart';

class AuthRoutes{
  Handler get handler{
    //create router
    final router = Router()
    // 4 post endpoint for create 
    //account and verifcation and chinging email and resite password

    ..post("/create_account", Createresponse)
    ..post("/verifcatoin", verifyEmailResponse)
    ..post("/reset_password ", verifyPasswordResponse)
    ..post("/change_email", ChangeEmaileResponse);
  
    return router;

  }
}