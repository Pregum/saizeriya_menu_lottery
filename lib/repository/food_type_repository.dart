import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saizeriya_menu_lottery/model/food_type.dart';
import 'package:saizeriya_menu_lottery/repository/supabase.dart';

part 'food_type_repository.g.dart';

@Riverpod(dependencies: [supabase])
Future<List<FoodType>> fetchAllFoodType(FetchAllFoodTypeRef ref) async {
  final repo = ref.read(supabaseProvider);
  final result = await repo.client
      .from('food_types')
      .select<List<dynamic>>('id, created_at, name');

  if (result.isEmpty) {
    return [];
  }

  try {
    final foodTypes = result.map((e) {
      debugPrint('e: $e');
      return FoodType.fromJson(e);
    }).toList();
    return foodTypes;
  } catch (e) {
    debugPrint('error!!! $e');
    rethrow;
  }
}
