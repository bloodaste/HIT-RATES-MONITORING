// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hitmap.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Hitmap)
const hitmapProvider = HitmapProvider._();

final class HitmapProvider extends $NotifierProvider<Hitmap, List<Hitsmodel>> {
  const HitmapProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'hitmapProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$hitmapHash();

  @$internal
  @override
  Hitmap create() => Hitmap();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Hitsmodel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Hitsmodel>>(value),
    );
  }
}

String _$hitmapHash() => r'16075a43914fef10b36c2f3df1e2f41c23c5723c';

abstract class _$Hitmap extends $Notifier<List<Hitsmodel>> {
  List<Hitsmodel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<Hitsmodel>, List<Hitsmodel>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<Hitsmodel>, List<Hitsmodel>>,
        List<Hitsmodel>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
