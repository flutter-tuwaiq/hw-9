import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'Autho.dart';

class BaseR {
Handler get handler{
final router = Router()

//Collect two routers, this path leads to Auth and combines it with the router there
..mount("/autho"  , Autho().handler)

//When typing / and then a word that does not exist, print a message to the user
..all("/<name|.*>" ,( Request _){
    return Response.notFound("NOT FOUND !!");
});


return router;
}
}