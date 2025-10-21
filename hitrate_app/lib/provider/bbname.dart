import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
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
    getnames();
    return [];
  }

  void getnames() {
    bbservice.getnames().listen(
      (snapshot) {
        final items = snapshot.docs.map((e) {
          final data = e.data() as Map<String, dynamic>;

          return Bbnamesmodel.fromMap(data).copywith(id: e.id);
        }).toList();

        state = items;
        print(state);
      },
    );
  }

  void addproduct(Bbnamesmodel name) async {
    await bbservice.addname(
      name.setname,
      name.totalpacks,
      name.buyersdets!,
    );
  }
}
