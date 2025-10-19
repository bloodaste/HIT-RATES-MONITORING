// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bbname.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Bbname)
const bbnameProvider = BbnameProvider._();

final class BbnameProvider
    extends $NotifierProvider<Bbname, List<Bbnamesmodel>> {
  const BbnameProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'bbnameProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$bbnameHash();

  @$internal
  @override
  Bbname create() => Bbname();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Bbnamesmodel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Bbnamesmodel>>(value),
    );
  }
}

String _$bbnameHash() => r'8f4f53e7596f61262e0a0e82780e2fc8511b4623';

abstract class _$Bbname extends $Notifier<List<Bbnamesmodel>> {
  List<Bbnamesmodel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<Bbnamesmodel>, List<Bbnamesmodel>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<Bbnamesmodel>, List<Bbnamesmodel>>,
        List<Bbnamesmodel>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
