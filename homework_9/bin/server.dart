import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';
import 'package:shelf_router/shelf_router.dart';

import 'BaseEnv/baseenv.dart';
import 'Routes/baserouts.dart';


void main(List<String> args) async {


  withHotreload(() => createServer());

}

Future<HttpServer> createServer()async {
  


  // Configure a pipeline that logs requests.
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(BaseRouts().handler);

  // For running in containers, we respect the PORT environment variable.
  final server = await serve(handler, BaseEnv().ip, BaseEnv().port);
  print(" server turn on http://${server.address.host}:${server.port} ");

return server;

}


