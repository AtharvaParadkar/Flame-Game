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

@ProviderFor(CanPlaySound)
final canPlaySoundProvider = CanPlaySoundProvider._();

final class CanPlaySoundProvider extends $NotifierProvider<CanPlaySound, bool> {
  CanPlaySoundProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'canPlaySoundProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$canPlaySoundHash();

  @$internal
  @override
  CanPlaySound create() => CanPlaySound();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$canPlaySoundHash() => r'c68a7d02c279b24b0880cb7d8bf0966a1d52d1e9';

abstract class _$CanPlaySound extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
