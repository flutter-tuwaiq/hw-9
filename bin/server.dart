// ignore_for_file: depend_on_referenced_packages
// Configure routes.
import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';
import 'Routes/baseRoute.dart';
import 'env/baseEnv.dart';

void main(List<String> _) => withHotreload(() => createServer());

Future<HttpServer> createServer() async {
  // Use any available host or container IP (usually `0.0.0.0`).

  // Configure a pipeline that logs requests.
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(baseRoute().handler);

  final server = await serve(handler, baseEnv().ip, baseEnv().port);
  print('Server listening on port ${server.port}');

  return server;
}
