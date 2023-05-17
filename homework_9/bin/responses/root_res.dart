import 'package:shelf/shelf.dart';
import '../response_msgs/ok_res.dart';

Response rootHandler(Request _) {
  return OkRes().okResponse(msg: "server is working!");
}
