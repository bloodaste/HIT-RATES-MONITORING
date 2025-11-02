import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hitrate_app/model/hitsmodel.dart';

class Dbservice {
  final CollectionReference mapping =
      FirebaseFirestore.instance.collection("Mapping");

  Stream<QuerySnapshot> gethits() {
    return mapping.orderBy('timestamp', descending: true).snapshots();
  }

  Future<void> delete(String id) async {
    return await mapping.doc(id).delete();
  }

  Future<void> updatehits(String setname, String rp, String id) async {
    return await mapping.doc(id).update({
      'Setname': setname,
      'remainingpacks': rp,
      'timestamp': Timestamp.now()
    });
  }

  Future<DocumentReference> addmapping(
      String setname, String remainingpacks, Cardsname cards) async {
    return await mapping.add({
      'card': cards.toMap(),
      'Setname': setname,
      'remainingpacks': remainingpacks,
      'timestamp': Timestamp.now()
    });
  }

  Future<void> addsr(String id, String srcard, String type) async {
    await mapping.doc(id).update({
      'card.$type': FieldValue.arrayUnion([srcard]),
    });
  }

  Future<void> removesr(String id, String srcard, String type) async {
    await mapping.doc(id).update({
      'card.$type': FieldValue.arrayRemove([srcard]),
    });
  }
}
