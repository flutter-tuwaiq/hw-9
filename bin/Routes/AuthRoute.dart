import 'package:shelf_router/shelf_router.dart';

import '../Response/Auth/changeEmailResponse.dart';
import '../Response/Auth/createResponse.dart';
import '../Response/Auth/restPasswordResponse.dart';
import '../Response/Auth/verifyEmailResponse.dart';

class AuthRoute {
  Router get handler {
    final router = Router()
    ..post('/create_account',createResponse)
    ..post('/verify',verificatinEmail)
    ..post('/restPassword', restPasswordResponse)
    ..post('/changeEmail', changeEmailResponse);

    return router;
  }
}