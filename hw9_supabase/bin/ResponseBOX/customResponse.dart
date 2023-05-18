import 'dart:convert';

import 'package:shelf/shelf.dart';
//This class is for allocating response processes in case of success or failure of the process

class customResponse {
  errorResponse({required String msg,})
   {
    return Response.badRequest(
      body: json.encode({'msg': msg, 'statusCode': 400}),
      headers: {'content-type': 'application/json'}, );
  }

  sucessResponse({required String msg, List? data}) {
    return Response.ok(
      json.encode({'msg': msg, 'statusCode': 200}),
      headers: {'content-type': 'application/json'},
    );
  }
}
