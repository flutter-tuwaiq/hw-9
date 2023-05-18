import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Response/Auth/changeEmail.dart';
import '../Response/Auth/changePassword.dart';
import '../Response/Auth/creatResponsees.dart';
import '../Response/Auth/verificatioEmail.dart';

class AuthRoute {
  Handler get handler {
    final router = Router()
      ..post('/creat_acount', creatResponse)
      ..post('/verify_account', verificatioEmail)
      ..post('/change_email', changeEmail)
      ..post('/reset_password', changePassword);

    return router;
  }
}
