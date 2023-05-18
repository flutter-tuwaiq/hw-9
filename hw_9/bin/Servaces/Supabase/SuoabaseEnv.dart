
import 'package:supabase/supabase.dart';

class SuoabaseEnv{

  // conecting with supabase 

  // URL link
  final _url = "https://qtqrijgzextsomsjbqhv.supabase.co";
  
  // secrite key

  final _key = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF0cXJpamd6ZXh0c29tc2picWh2Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY4NDIzMDYxNSwiZXhwIjoxOTk5ODA2NjE1fQ.MGc71qsZKSIyvaBvfSjp0QGY26t85TU29ODtGZHQBH8";

  SupabaseClient get supabase{

    final supabase = SupabaseClient(_url , _key);

    return supabase;
  }
}