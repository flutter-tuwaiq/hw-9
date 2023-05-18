import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Responses/ResetPass.dart';
import '../Responses/createAccount.dart';
import '../Responses/emailCange.dart';
import '../Responses/verification.dart';

class Autho {
  Handler get handler {
    final router = Router()


    //You can enter this router by typing /auth and then writing one of these paths to activate the process
      ..post("/create", createAccount)
      ..post("/ver", verification)
      ..post("/reset", ResetPass)
      ..post("/change_email", emailChange);

    return router;
  }
}
