// import 'dart:convert';

// import 'package:shelf/shelf.dart';
// import 'package:supabase/supabase.dart';

// import '../../ResponseMsg/CustomResponse.dart';
// import '../../Services/Supabase/supabaseEnv.dart';

// verficationEmail(Request req) async {
//   try {
//     final body = json.decode(await req.readAsString());
//     await SupabaseEnv().supabase.auth.admin.verfiyOTP(
//       token: body['OTP'],
//       type: OtpType.signup,
//       email: body['email'],
//     );
//   } catch (error) {
//     return CustomResponse().errorResponse(msg: "msj");
//   }
// }
