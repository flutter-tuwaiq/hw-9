import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Responses/CreateAccount.dart';
import '../Responses/VerifyAccount.dart';
import '../Responses/ResetPassword.dart';
import '../Responses/ChangeEmail.dart';

class AuthRoute {
  Handler get handler {
    final router = Router()
      ..post('/create_account', createAccount)
      ..post('/verify_account', verifyAccount)
      ..post('/reset_password', resetPassword)
      ..post('/change_email', changeEmail);

    return router;
  }
}
