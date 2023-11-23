// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchAllMenusHash() => r'eb950f34099fea896f3590633bb028d621cafb12';

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
String _$menuRepositoryHash() => r'440b287b4b456df0a55b3b851f57472d5d6582dd';

/// See also [MenuRepository].
@ProviderFor(MenuRepository)
final menuRepositoryProvider =
    AutoDisposeNotifierProvider<MenuRepository, MenuRepository>.internal(
  MenuRepository.new,
  name: r'menuRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$menuRepositoryHash,
  dependencies: <ProviderOrFamily>[supabaseProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    supabaseProvider,
    ...?supabaseProvider.allTransitiveDependencies
  },
);

typedef _$MenuRepository = AutoDisposeNotifier<MenuRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
