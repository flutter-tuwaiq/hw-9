import 'dart:convert';

import 'package:shelf/shelf.dart';

class CustomResponse {
  errorResponse({required String msg, Map? data}) {
    // data part is optional
    return Response.badRequest(
        body: json.encode({'msg': msg, 'StatusCode': 400, 'data': data}),
        headers: {'Content-Type': 'application/json'});
  }

  successResponse({required String msg, List? data}) {
    return Response.ok(
        json.encode({'msg': msg, 'StatusCode': 200, 'data': data}),
        headers: {'Content-Type': 'application/json'},);
  }
}
