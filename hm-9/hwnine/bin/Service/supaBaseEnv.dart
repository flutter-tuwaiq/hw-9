import 'package:supabase/supabase.dart';

class SupaBaseEnv{

  final _url = "https://jlbxxaeqpramtzsbcypi.supabase.co";
  final _key = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpsYnh4YWVxcHJhbXR6c2JjeXBpIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY4NDIzMDYxMCwiZXhwIjoxOTk5ODA2NjEwfQ.r8MaBkEqF2M0EtBXaD44a4A2fED_e64mwWJ5Vf33omE";

  SupabaseClient get supaBase {

      final supBase = SupabaseClient( _url, _key);

    return supBase;
  }
}