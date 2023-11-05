import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saizeriya_menu_lottery/model/memo.dart';
import 'package:saizeriya_menu_lottery/repository/supabase.dart';

part 'memo_repository.g.dart';

@Riverpod(dependencies: [supabase])
Future<List<Memo>> fetchAllMemos(FetchAllMemosRef ref) async {
  final repo = ref.read(supabaseProvider);
  final result = await repo.client.from('memos').select();
  final memos = result.map((e) => Memo.fromJson(e));
  return memos;
}
