import 'package:hitrate_app/firebase/que.dart';
import 'package:hitrate_app/model/quemodel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'que.g.dart';

@riverpod
class Que extends _$Que {
  final quedb = Quedbservice();

  @override
  List<Quemodel> build() {
    getque();
    return [];
  }

  void getque() {
    quedb.getservice().listen((snapshots) {
      final que = snapshots.docs.map((e) {
        final data = e.data as Map<String, dynamic>;

        return Quemodel.fromMap(data);
      }).toList();
      state = que;
    });
  }

  void add(Quemodel que) {
    quedb.addque(que.buyersname, que.refid);
  }
}
