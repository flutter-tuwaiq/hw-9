import 'package:http/http.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'creatrespns.dart';

class AuthRaut {
  Handler get handler {
    final router = Router()..post('/crait_accaunt', createResponse);

    return router;
  }
}
