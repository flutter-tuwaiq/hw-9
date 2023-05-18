import 'dart:io';
import 'package:shelf_hotreload/shelf_hotreload.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'Routes/BaseRoute.dart';
import 'env/ConfigEnv.dart';


void main(List<String> args) async {
   withHotreload(() => createServer());
}


Future<HttpServer> createServer() async{
  final pipline = Pipeline().addMiddleware(logRequests()).addHandler(BaseRoute().handler);
  final server = await serve(pipline,Environment().ip, Environment().port);
  print('Server listening on port ${server.port}');

  return server;
}