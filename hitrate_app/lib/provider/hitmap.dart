import 'package:hitrate_app/firebase/hitsperbox.dart';
import 'package:hitrate_app/model/hitsmodel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hitmap.g.dart';

@riverpod
class Hitmap extends _$Hitmap {
  final db = Dbservice();
  List<Hitsmodel> hits = [];

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

      hits = items;
      state = items;
    });
  }

  Future<void> addproduct(Hitsmodel hit) async {
    await db.addmapping(
      hit.setname,
      hit.ar,
      hit.rr,
      hit.sar,
      hit.remainingpacks,
      hit.cardset,
    );
  }

  Future<void> deleteproduct(String id) async {
    await db.delete(id);
  }

  Future<void> updatehit(Hitsmodel hitsu) async {
    await db.updatehits(
      hitsu.setname,
      hitsu.ar,
      hitsu.sar,
      hitsu.rr,
      hitsu.remainingpacks,
      hitsu.id!,
    );
  }

  void filterset(String setname) {
    if (setname.isEmpty) {
      state = hits;
    } else {
      final filtered = state
          .where((e) => e.setname.toLowerCase().contains(setname.toLowerCase()))
          .toList();
      state = filtered;
    }
  }
}
