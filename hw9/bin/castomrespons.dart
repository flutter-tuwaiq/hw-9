import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

class CastomRespons {
  badRequest({required String msg}) {
    return Response.badRequest(
      body: json.encode({'msg': msg, 'statuscode': 400}),
      headers: {'content-type': 'application/json'},
    );
  }

  successResponse({required String msg}) {
    return Response.ok(
      json.encode({'msg': msg, 'statusCode': 200}),
      headers: {'content-type': 'application'},
    );
  }
}
