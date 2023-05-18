
import 'dart:convert';

import 'package:shelf/shelf.dart';

class CustomResponse{

  //create responce massege with type of error ex :400 , 404

  errorResponse({
    required String msg,
  }){
    return Response.badRequest(
      body: json.encode({"msg" : msg , "statusCode" : 400}),
      headers: {"content-type" : "application/json"},
    );
  }

  //create success responce massege 

  successResponse({
    required String msg , List? data,
  }){
    return Response.ok(
      json.encode({"msg" : msg , "statusCode" : 200 , "data" : data}),
      headers: {"content-type" : "application/json"},
    );
  }
}