// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bbname.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Bbname)
const bbnameProvider = BbnameProvider._();

final class BbnameProvider extends $NotifierProvider<Bbname, List<Bbnamess>> {
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
  Override overrideWithValue(List<Bbnamess> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Bbnamess>>(value),
    );
  }
}

String _$bbnameHash() => r'81e79c1edce71d5a0481c493e34393465d907b57';

abstract class _$Bbname extends $Notifier<List<Bbnamess>> {
  List<Bbnamess> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<Bbnamess>, List<Bbnamess>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<Bbnamess>, List<Bbnamess>>,
        List<Bbnamess>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
