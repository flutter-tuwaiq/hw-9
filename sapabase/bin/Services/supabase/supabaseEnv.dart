import 'package:supabase/supabase.dart';

class supabaseEnv {
  final _url = 'https://etrrpcdllbzhuvilggxk.supabase.co';
  final _key =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV0cnJwY2RsbGJ6aHV2aWxnZ3hrIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY4NDIzMDYxNywiZXhwIjoxOTk5ODA2NjE3fQ.StBUUABx_tBEcENM0HpMPEE1vK0i8fasd0_55rvfT3w ';

  SupabaseClient get supabase {
    final supabase = SupabaseClient(_url, _key);
    return supabase;
  }
}
