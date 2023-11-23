import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saizeriya_menu_lottery/model/allergen.dart';
import 'package:saizeriya_menu_lottery/model/menu.dart';
import 'package:saizeriya_menu_lottery/repository/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'menu_repository.g.dart';

@Riverpod(dependencies: [supabase])
Future<List<Menu>> fetchAllMenus(FetchAllMenusRef ref) async {
  final repo = ref.read(supabaseProvider);
  final result = await repo.client
      .from('menus')
      // .select<List<dynamic>>('*, food_types (name) ');
      // .select<List<dynamic>>('*, food_types(id, name, created_at)');
      .select<List<dynamic>>('*, food_types(*), allergens(*)');
      // .select<List<dynamic>>('*, food_types(*)');
  if (result.isEmpty) {
    return [];
  }
  // final menus = result.map((e) => Menu.fromJson(e)).toList();
  try {
    final menus = result.map((e) {
      debugPrint('e: $e');
      return Menu.fromJson(e);
    }).toList();
    debugPrint('first: ${ menus[0] }');
    return menus;
  } catch (e) {
    debugPrint('error!!! $e');
    rethrow;
  }
}

@Riverpod(dependencies: [supabase])
Future<List<Allergen>> fetchAllergensById(
    FetchAllergensByIdRef ref, int id) async {
  try {
    final repo = ref.read(supabaseProvider);
    final result = await repo.client
        .from('menus')
        // .select<List<dynamic>>('id, name, allergens ( * )')
        // .select('id, menu_id, allergen_id, menus ( *, allergens (*) )')
        .select('*, allergens ( id, name )')
        .eq('id', id);

    if (result.isEmpty) {
      return [];
    }

    final allergens = result.map((e) {
      debugPrint('e: $e');
      return Menu.fromJson(e);
    }).toList();
    return allergens;
  } catch (e) {
    debugPrint('error!!!! $e');
    rethrow;
  }
}

@Riverpod(dependencies: [supabase])
class MenuRepository extends _$MenuRepository {
  late final Supabase _repo;
  @override
  MenuRepository build() {
    final repo = ref.read(supabaseProvider);
    _repo = repo;
    return this;
  }

  Future<List<Menu>> fetchAll() async {
    final result = await _repo.client.from('menus').select<List<dynamic>>('*');
    if (result.isEmpty) {
      return [];
    }

    final menus = result.map((e) => Menu.fromJson(e)).toList();
    return menus;
  }
}
