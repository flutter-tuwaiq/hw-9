import 'package:shelf_router/shelf_router.dart';

import 'auth_rout.dart';

class BaseRout{
  Router get baseRout{
    final router = Router()
    ..mount('/auth', (AuthRout().authRout));

    return router;
  }
}