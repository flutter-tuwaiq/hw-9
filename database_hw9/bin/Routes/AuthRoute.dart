import 'package:shelf_router/shelf_router.dart';

import '../Responses/Auth/changeEmailResponse.dart';
import '../Responses/Auth/createResponse.dart';
import '../Responses/Auth/loginResponse.dart';
import '../Responses/Auth/resetPasswordResponse.dart';
import '../Responses/Auth/verifyAccountResponse.dart';
import '../Responses/rootHandler.dart';

class AuthRoute {
  Router get route {
    final router = Router()
      ..get('/', rootHandler)
      ..post('/create_account', createResponse)
      ..post('/verify_account', verifyAccountResponse)
      ..post('/login', loginResponse)
      ..post('/reset_password', resetPasswordResponse)
      ..post('/change_email', changeEmailResponse);

    return router;
  }
}
