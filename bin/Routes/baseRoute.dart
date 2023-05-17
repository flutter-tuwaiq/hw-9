// ignore_for_file: camel_case_types, file_names, recursive_getters

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'authRoute.dart';

class baseRoute {
  Router get handler {
    final router = Router()
      ..mount('/auth', authRoute().handler)
      ..all('/<name|.*>', (Request req) {
        return Response.badRequest(body: "check your path again");
      });

    return router;
  }
}

// Response _rootHandler(Request _) {
//   return Response.ok('Hello, World!\n');
// }
