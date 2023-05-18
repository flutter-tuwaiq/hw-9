import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Response/Auth/creatresponse.dart';
import '../Response/Auth/verificationEmail.dart';

class AuthRoute{

Handler  get handler { 
  
 final router = Router()
..post("/creat_acount",createRosposnse)
..post("/vrify",verificationEmail);
  return router;
  
    }
}