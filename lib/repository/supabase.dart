import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'supabase.g.dart';

@riverpod
Supabase supabase(SupabaseRef ref) {
  throw UnimplementedError();
}

@riverpod
Future<Supabase> supabaseAsync(
    SupabaseAsyncRef ref, String url, String anonKey) async {
  final instance = await Supabase.initialize(url: url, anonKey: anonKey);
  return instance;
}
