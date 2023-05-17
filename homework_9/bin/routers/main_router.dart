import 'package:shelf_router/shelf_router.dart';
import '../responses/change_email_res.dart';
import '../responses/create_account_res.dart';
import '../responses/reset_password_res.dart';
import '../responses/root_res.dart';
import '../responses/verify_account_res.dart';

class MainRouter {
  Router get handler {
    final router = Router()
      ..get('/', rootHandler)
      ..post('/create_account', createAccountHandler)
      ..post('/verify_account', verifyAccountHandler)
      ..post('/reset_password', resetPasswordHandler)
      ..post('/change_email', changeEmailHandler);

    return router;
  }
}
