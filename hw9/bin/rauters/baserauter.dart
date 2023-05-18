import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../authrautar.dart';

class baseRaut {
  Handler get handler {
    final router = Router()..mount('/auth', AuthRaut().handler);

    return router;
  }
}
