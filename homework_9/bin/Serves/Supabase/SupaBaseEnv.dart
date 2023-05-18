import 'package:supabase/supabase.dart';

class SupaBaseEv{


final  _url  = 'https://kqohvodkdxrfhaznqfyp.supabase.co'; 

final  _key  = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imtxb2h2b2RrZHhyZmhhem5xZnlwIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY4NDIzMDYwNCwiZXhwIjoxOTk5ODA2NjA0fQ.y-040CCq526ddW-ZQ7_shvbZWsk5hczbMINKxQVXGbE'; 


SupabaseClient get subaHandler{

 
    final supabase = SupabaseClient(_url, _key);

return supabase;

}

  get supabase => null;

}