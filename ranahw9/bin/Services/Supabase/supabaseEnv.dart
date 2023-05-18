import 'package:supabase/supabase.dart';

class SupabaseEnv {
  final _url = 'https://mdqptpghnrfadezihtlc.supabase.co';
  final _key =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1kcXB0cGdobnJmYWRlemlodGxjIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY4NDMyMTgxMywiZXhwIjoxOTk5ODk3ODEzfQ.I1PQzYYDVOHnZmlE2XANhq1TmoiJRlN-qc6CDRWyZnY';

  SupabaseClient get supabase {
    final supabase = SupabaseClient(_url, _key);

    return supabase;
  }
}
