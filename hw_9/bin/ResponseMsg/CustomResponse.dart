import 'dart:convert';
import 'package:shelf/shelf.dart';

// This file for creating A custom Response.
class CustomResponse {
  successResponse({
    required String msg,
    List? data,
  }) {
    return Response.ok(
      json.encode({'msg': msg, 'statusCode': 200}),
      headers: {'content-type': 'application/json'},
    );
  }

  errorResponse({required String msg}) {
    return Response.badRequest(
      body: json.encode({'msg': msg, 'statusCode': 400}),
      headers: {'content-type': 'application/json'},
    );
  }
}
