// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supabase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$supabaseHash() => r'2f5cd003e857ccac9737e69f02c3b0053cf9604f';

/// See also [supabase].
@ProviderFor(supabase)
final supabaseProvider = AutoDisposeProvider<Supabase>.internal(
  supabase,
  name: r'supabaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$supabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SupabaseRef = AutoDisposeProviderRef<Supabase>;
String _$supabaseAsyncHash() => r'ac5b5d58aac7246d900e7c0adf2fae0f35d25251';

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

/// See also [supabaseAsync].
@ProviderFor(supabaseAsync)
const supabaseAsyncProvider = SupabaseAsyncFamily();

/// See also [supabaseAsync].
class SupabaseAsyncFamily extends Family<AsyncValue<Supabase>> {
  /// See also [supabaseAsync].
  const SupabaseAsyncFamily();

  /// See also [supabaseAsync].
  SupabaseAsyncProvider call(
    String url,
    String anonKey,
  ) {
    return SupabaseAsyncProvider(
      url,
      anonKey,
    );
  }

  @override
  SupabaseAsyncProvider getProviderOverride(
    covariant SupabaseAsyncProvider provider,
  ) {
    return call(
      provider.url,
      provider.anonKey,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'supabaseAsyncProvider';
}

/// See also [supabaseAsync].
class SupabaseAsyncProvider extends AutoDisposeFutureProvider<Supabase> {
  /// See also [supabaseAsync].
  SupabaseAsyncProvider(
    String url,
    String anonKey,
  ) : this._internal(
          (ref) => supabaseAsync(
            ref as SupabaseAsyncRef,
            url,
            anonKey,
          ),
          from: supabaseAsyncProvider,
          name: r'supabaseAsyncProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$supabaseAsyncHash,
          dependencies: SupabaseAsyncFamily._dependencies,
          allTransitiveDependencies:
              SupabaseAsyncFamily._allTransitiveDependencies,
          url: url,
          anonKey: anonKey,
        );

  SupabaseAsyncProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.url,
    required this.anonKey,
  }) : super.internal();

  final String url;
  final String anonKey;

  @override
  Override overrideWith(
    FutureOr<Supabase> Function(SupabaseAsyncRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SupabaseAsyncProvider._internal(
        (ref) => create(ref as SupabaseAsyncRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        url: url,
        anonKey: anonKey,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Supabase> createElement() {
    return _SupabaseAsyncProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SupabaseAsyncProvider &&
        other.url == url &&
        other.anonKey == anonKey;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, url.hashCode);
    hash = _SystemHash.combine(hash, anonKey.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SupabaseAsyncRef on AutoDisposeFutureProviderRef<Supabase> {
  /// The parameter `url` of this provider.
  String get url;

  /// The parameter `anonKey` of this provider.
  String get anonKey;
}

class _SupabaseAsyncProviderElement
    extends AutoDisposeFutureProviderElement<Supabase> with SupabaseAsyncRef {
  _SupabaseAsyncProviderElement(super.provider);

  @override
  String get url => (origin as SupabaseAsyncProvider).url;
  @override
  String get anonKey => (origin as SupabaseAsyncProvider).anonKey;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
