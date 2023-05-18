import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'AuthRoute.dart';

class BaseRoute{

  Router get handler{
    Router router = Router()
    ..mount('/auth', AuthRoute().handler)
    ..all("/<name>|.*",(Request req){ 
      return Response.notFound("Page not found please check your path");
    });

    return router;
  }
}