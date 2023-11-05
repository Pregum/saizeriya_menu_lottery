// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchAllMenusHash() => r'eab8894b4887fa6eceaf91212614eb433cd7b75e';

/// See also [fetchAllMenus].
@ProviderFor(fetchAllMenus)
final fetchAllMenusProvider = AutoDisposeFutureProvider<List<Menu>>.internal(
  fetchAllMenus,
  name: r'fetchAllMenusProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchAllMenusHash,
  dependencies: <ProviderOrFamily>[supabaseProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    supabaseProvider,
    ...?supabaseProvider.allTransitiveDependencies
  },
);

typedef FetchAllMenusRef = AutoDisposeFutureProviderRef<List<Menu>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
