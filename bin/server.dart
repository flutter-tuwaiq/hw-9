import 'dart:io';
import 'package:shelf_hotreload/shelf_hotreload.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'Routes/BaseRoute.dart';
import 'env/ConfigEnv.dart';

// Configure routes.

void main(List<String> args) async {
   withHotreload(() => createServer());
}


Future<HttpServer> createServer() async{
   // Use any available host or container IP (usually `0.0.0.0`).
  
  // Configure a pipeline that logs requests.
  final pipline = Pipeline().addMiddleware(logRequests()).addHandler(BaseRoute().handler);

  // For running in containers, we respect the PORT environment variable.
  
  final server = await serve(pipline,Environment().ip, Environment().port);
  print('Server listening on port ${server.port}');

  return server;
}
