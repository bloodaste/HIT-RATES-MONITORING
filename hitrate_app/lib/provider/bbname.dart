import 'package:hitrate_app/firebase/boxbreak.dart';
import 'package:hitrate_app/model/bbnames.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bbname.g.dart';

@riverpod
class Bbname extends _$Bbname {
  final bbservice = Boxbreakservice();
  List<Bbnamess> data = [];

  @override
  List<Bbnamess> build() {
    getnames();
    return [];
  }

  void getnames() {
    bbservice.getnames().listen(
      (snapshots) {
        final name = snapshots.docs.map((e) {
          final finalname = e.data() as Map<String, dynamic>;

          return Bbnamess.frommap(finalname).copywith(id: e.id);
        }).toList();
        state = name;
      },
    );
  }

  void addcard(Bbnamess addboxbreak) async {
    await bbservice.addname(
      addboxbreak.setname,
      addboxbreak.packs,
      addboxbreak.names,
    );
  }

  void addbuyers(Nameconfig names, String id) async {
    await bbservice.addnames(names, id);
  }
}
