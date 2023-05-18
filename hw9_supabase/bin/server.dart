import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';
//import 'package:shelf_router/shelf_router.dart';

import 'Router/BaseR.dart';
import 'env/env.dart';

void main() async {
  withHotreload(() => createServer());
}

Future<HttpServer> createServer() async {
  // Configure a pipeline that logs requests.
  final handler =
      Pipeline().addMiddleware(logRequests()).addHandler(BaseR().handler);

  final server = await serve(handler, env().ip, env().port);
  print('Server listening on port ${server.port}');

  return server;
}
