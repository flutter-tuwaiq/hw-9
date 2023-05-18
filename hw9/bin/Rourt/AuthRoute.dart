import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../allResponse/changeEmail.dart';
import '../allResponse/creatAccount.dart';
import '../allResponse/login.dart';
import '../allResponse/resetPassword.dart';
import '../allResponse/verificationEmail.dart';

class AuthRoute{
  Handler get handler{
    final router=Router()
  ..post('/verification',verificationEmail)
  ..post('/reset_pass',resetPassword)
  ..post('/loginh',login)
  ..post("/changeEmail", changeEmail)
  ..post('/create_account',creatAccount);
    return router;
}
}