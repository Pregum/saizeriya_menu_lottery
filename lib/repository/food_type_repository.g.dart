// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_type_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchAllFoodTypeHash() => r'790de12f7371b82d1f211de0c029f67449b33aef';

/// See also [fetchAllFoodType].
@ProviderFor(fetchAllFoodType)
final fetchAllFoodTypeProvider =
    AutoDisposeFutureProvider<List<FoodType>>.internal(
  fetchAllFoodType,
  name: r'fetchAllFoodTypeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchAllFoodTypeHash,
  dependencies: <ProviderOrFamily>[supabaseProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    supabaseProvider,
    ...?supabaseProvider.allTransitiveDependencies
  },
);

typedef FetchAllFoodTypeRef = AutoDisposeFutureProviderRef<List<FoodType>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
