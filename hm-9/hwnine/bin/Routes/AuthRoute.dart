import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../Response/AuthResponse.dart';

class AuthRoute {

    Handler get handler {

        final router = Router()
          ..post("/create_account", createResponse)
          ..post("/virfiy_email", verifyResponse)
          ..post("/reset_passwor", resetPasswor)
          ..post("/change_email", emailChange);

             //final pipline = Pipeline().addMiddleware(CheckSendData().checkData()).addHandler(router);

        return router;
  }
}