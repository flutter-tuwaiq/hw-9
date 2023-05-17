// ignore_for_file: file_names

import 'package:shelf_router/shelf_router.dart';
import '../Responses/changeEmailHandler.dart';
import '../Responses/createAccountHandler.dart';
import '../Responses/resetPasswordHandler.dart';
import '../Responses/verifyAccountHandler.dart';

class AuthRoute {
  Router get handler {
    final router = Router()
      ..post('/create_account', createAccountHandler)
      ..post('/verify_account', verifyAccountHandler)
      ..post('/reset_password', resetPasswordHandler)
      ..post('/change_email', changeEmailHandler);

    return router;
  }
}
