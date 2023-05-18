import 'package:http/http.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Response/Auth/CreateResponse.dart';
import '../Response/Auth/verfiyEmail.dart';
import '../Response/Auth/changeemail.dart';
import '../Response/Auth/respass.dart';

class AuthRoute {
  Handler get handler {
    final router = Router()
      ..post('/create_account', CreateResponse)
      ..post('/reset_password', resetPass)
      ..post('/change_email', changeEmail)
      ..post('/verfie-email', verficationEmail);

    return router;
  }
}
