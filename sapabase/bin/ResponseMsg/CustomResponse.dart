import 'dart:convert';

import 'package:shelf/shelf.dart';

class CustomResponse {
  errorResponse({required String msg}) {
    return Response.badRequest(body: json.encode({'msg': msg}));
  }

  successResponse({required String msg, required Map<String, dynamic> data}) {}
}
