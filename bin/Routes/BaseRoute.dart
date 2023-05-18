import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'AuthRoute.dart';

class BaseRoute {


  Handler get handler {

    final router = Router()
    ..mount("/auth", AuthRoute().handler);
    // ..post(route, handler);
    return router;
  }
}