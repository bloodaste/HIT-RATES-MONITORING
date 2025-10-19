import 'package:hitrate_app/firebase/boxbreak.dart';
import 'package:hitrate_app/model/bbnames.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bbname.g.dart';

@riverpod
class Bbname extends _$Bbname {
  final bbservice = Boxbreakservice();
  List<Bbnamesmodel> data = [];

  @override
  List<Bbnamesmodel> build() {
    return [];
  }
}
