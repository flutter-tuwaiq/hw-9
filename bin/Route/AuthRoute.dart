import 'package:shelf_router/shelf_router.dart';

import '../Response/Auth/changeEmail.dart';
import '../Response/Auth/createAccount.dart';
import '../Response/Auth/resetPassword.dart';
import '../Response/Auth/verifyEmailResponse.dart';


class AuthRoute{

  Router get handler{
    Router router = Router()
    ..post("/create_account", createAccount )
    ..post("/verify_account",  verifyEmail)
    ..post("/reset_password", resetPassword)
    ..post("/change_email", changeEmail);
    
    return router;
  }
}