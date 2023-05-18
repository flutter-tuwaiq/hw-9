import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'authRoute.dart';

class BaseRouts{

Handler get handler {

  final router = Router()
  ..mount("/auth",AuthRoute().handler)
  ..all("/<name | .*>", (Request _){

  return Response.notFound("page not found ");

  });

  return router;



    }

}