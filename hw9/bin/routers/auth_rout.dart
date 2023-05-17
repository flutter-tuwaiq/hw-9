import 'package:shelf_router/shelf_router.dart';

import '../response/create_account.dart';
import '../response/email_change.dart';
import '../response/password_rest.dart';
import '../response/verafic_email.dart';

class AuthRout{
  Router get authRout{
    final router = Router()
    ..post('/user', creatAccount)
    ..post('/user/email', veraficEmail)
    ..post('/user/changpassword', passwordRest)
    ..post('/user/changemail', emailChange);
    
    return router;
  }
}