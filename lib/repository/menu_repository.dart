import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saizeriya_menu_lottery/model/menu.dart';
import 'package:saizeriya_menu_lottery/repository/supabase.dart';

part 'menu_repository.g.dart';

@Riverpod(dependencies: [supabase])
Future<List<Menu>> fetchAllMenus(FetchAllMenusRef ref) async {
  final repo = ref.read(supabaseProvider);
  final result = await repo.client.from('menus').select('*');
  final menus = result.map((e) => Menu.fromJson(e));
  return menus;
}
