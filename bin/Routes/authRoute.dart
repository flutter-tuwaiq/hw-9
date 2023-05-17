// ignore_for_file: file_names, camel_case_types

import 'package:shelf_router/shelf_router.dart';

import '../Responses/Auth/changeemailResponse.dart';
import '../Responses/Auth/passwordResetResponse.dart';
import '../Responses/Auth/signupResponse.dart';
import '../Responses/Auth/verifyemailResponse.dart';

class authRoute {
  Router get handler {
    final router = Router()
      ..post('/signup', signupResponse)
      ..post('/verify_email', verifyemailResponse)
      ..post('/passwordReset', passwordResetResponse)
      ..post('/change_email', changeemailResponse);

    return router;
  }
}
