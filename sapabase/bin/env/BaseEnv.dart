import 'dart:io';
import 'package:shelf/shelf.dart';

class BaseEnv {
  final ip = InternetAddress.anyIPv4;

  final port = int.parse(Platform.environment['PORT'] ?? '8080');
}
