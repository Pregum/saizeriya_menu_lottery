// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchAllMenusHash() => r'ed2e5f76f3c45ecad15f948be53fc15a6a10ec86';

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
String _$fetchAllergensByIdHash() =>
    r'087d22c5ea37bce33b84a1bdb92968d7f542aec0';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [fetchAllergensById].
@ProviderFor(fetchAllergensById)
const fetchAllergensByIdProvider = FetchAllergensByIdFamily();

/// See also [fetchAllergensById].
class FetchAllergensByIdFamily extends Family<AsyncValue<List<Allergen>>> {
  /// See also [fetchAllergensById].
  const FetchAllergensByIdFamily();

  /// See also [fetchAllergensById].
  FetchAllergensByIdProvider call(
    int id,
  ) {
    return FetchAllergensByIdProvider(
      id,
    );
  }

  @override
  FetchAllergensByIdProvider getProviderOverride(
    covariant FetchAllergensByIdProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    supabaseProvider
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>{
    supabaseProvider,
    ...?supabaseProvider.allTransitiveDependencies
  };

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchAllergensByIdProvider';
}

/// See also [fetchAllergensById].
class FetchAllergensByIdProvider
    extends AutoDisposeFutureProvider<List<Allergen>> {
  /// See also [fetchAllergensById].
  FetchAllergensByIdProvider(
    int id,
  ) : this._internal(
          (ref) => fetchAllergensById(
            ref as FetchAllergensByIdRef,
            id,
          ),
          from: fetchAllergensByIdProvider,
          name: r'fetchAllergensByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchAllergensByIdHash,
          dependencies: FetchAllergensByIdFamily._dependencies,
          allTransitiveDependencies:
              FetchAllergensByIdFamily._allTransitiveDependencies,
          id: id,
        );

  FetchAllergensByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<List<Allergen>> Function(FetchAllergensByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchAllergensByIdProvider._internal(
        (ref) => create(ref as FetchAllergensByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Allergen>> createElement() {
    return _FetchAllergensByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchAllergensByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchAllergensByIdRef on AutoDisposeFutureProviderRef<List<Allergen>> {
  /// The parameter `id` of this provider.
  int get id;
}

class _FetchAllergensByIdProviderElement
    extends AutoDisposeFutureProviderElement<List<Allergen>>
    with FetchAllergensByIdRef {
  _FetchAllergensByIdProviderElement(super.provider);

  @override
  int get id => (origin as FetchAllergensByIdProvider).id;
}

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
