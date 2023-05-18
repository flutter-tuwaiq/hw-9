

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'AuthRoutes.dart';

class MainRoutes{

  Handler get handler{

    //create router 
    final router = Router()
    //inategrate MainRoutes with AuthRoutes
    ..mount("/auth" , AuthRoutes().handler)

    // to check if the page are not found

    ..all("/<name>|>*" , (Request _){

        return Response.notFound("page not found");
    });

    return router;

  }
}