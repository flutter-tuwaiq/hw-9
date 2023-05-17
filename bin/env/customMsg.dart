// ignore_for_file: camel_case_types, file_names

import 'dart:convert';

import 'package:shelf/shelf.dart';

class customMsg{
  badReqResponse({required String msg}){
    return Response.badRequest(
      body: json.encode({"msg":msg, "statusCode": 400}),
      headers: {"content-type":"applecation/json"},
    );
  }

    successResponse({required String msg, List? data}){
    return Response.ok(
     json.encode({"msg":msg, "statusCode": 200, 'data':data}),
      headers: {"content-type":"applecation/json"},
    );
  }
}