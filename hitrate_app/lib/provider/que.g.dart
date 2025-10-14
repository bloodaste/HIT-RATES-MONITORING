// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'que.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Que)
const queProvider = QueProvider._();

final class QueProvider extends $NotifierProvider<Que, List<Quemodel>> {
  const QueProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'queProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$queHash();

  @$internal
  @override
  Que create() => Que();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Quemodel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Quemodel>>(value),
    );
  }
}

String _$queHash() => r'58b44e63eb8fd657f1d725f6ba89bdba38118506';

abstract class _$Que extends $Notifier<List<Quemodel>> {
  List<Quemodel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<Quemodel>, List<Quemodel>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<Quemodel>, List<Quemodel>>,
        List<Quemodel>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
