import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';

import 'AuthRoute.dart';

class BaseRoute {
  Handler get handler {
    final router = Router()
      ..mount('/auth', AuthRoute().handler)
      ..all('/<name|.*>', (Request _) {
        return Response.forbidden("page not found");
      });

    return router;
  }
}
