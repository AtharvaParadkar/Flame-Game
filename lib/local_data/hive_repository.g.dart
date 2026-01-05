// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(hiveRepository)
final hiveRepositoryProvider = HiveRepositoryProvider._();

final class HiveRepositoryProvider
    extends $FunctionalProvider<HiveRepository, HiveRepository, HiveRepository>
    with $Provider<HiveRepository> {
  HiveRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hiveRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hiveRepositoryHash();

  @$internal
  @override
  $ProviderElement<HiveRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HiveRepository create(Ref ref) {
    return hiveRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HiveRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HiveRepository>(value),
    );
  }
}

String _$hiveRepositoryHash() => r'd3c0c996579f88c8994318d49832866617cbaa57';
