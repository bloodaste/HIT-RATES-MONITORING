import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hitrate_app/firebase/hitsperbox.dart';
import 'package:hitrate_app/model/hitsmodel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hitmap.g.dart';

@riverpod
class Hitmap extends _$Hitmap {
  final db = Dbservice();

  @override
  List<Hitsmodel> build() {
    // initial state is empty list
    gethits();
    return [];
  }

  void gethits() {
    db.gethits().listen((snapshots) {
      final items = snapshots.docs.map((e) {
        final data = e.data() as Map<String, dynamic>;

        return Hitsmodel.fromJson(data).copyWith(id: e.id);
      }).toList();

      state = items;
    });
  }
}
