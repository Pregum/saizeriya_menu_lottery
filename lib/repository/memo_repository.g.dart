// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchAllMemosHash() => r'3fca4d513d2e7708f37228b7c3d72abe3c990df5';

/// See also [fetchAllMemos].
@ProviderFor(fetchAllMemos)
final fetchAllMemosProvider = AutoDisposeFutureProvider<List<Memo>>.internal(
  fetchAllMemos,
  name: r'fetchAllMemosProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchAllMemosHash,
  dependencies: <ProviderOrFamily>[supabaseProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    supabaseProvider,
    ...?supabaseProvider.allTransitiveDependencies
  },
);

typedef FetchAllMemosRef = AutoDisposeFutureProviderRef<List<Memo>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
