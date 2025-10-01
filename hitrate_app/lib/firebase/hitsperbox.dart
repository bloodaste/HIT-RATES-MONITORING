import 'package:cloud_firestore/cloud_firestore.dart';

class Dbservice {
  final CollectionReference mapping =
      FirebaseFirestore.instance.collection("Mapping");

  Stream<QuerySnapshot> gethits() {
    return mapping.orderBy('timestamp', descending: true).snapshots();
  }

  Future<void> delete(String id) async {
    return await mapping.doc(id).delete();
  }

  Future<void> updatehits(String setname, String ar, String sr, String rp,
      String rr, String id) async {
    return await mapping.doc(id).update({
      'ar': ar,
      'Setname': setname,
      'rr': rr,
      'sar': sr,
      'remainingpacks': rp,
      'timestamp': Timestamp.now()
    });
  }

  Future<DocumentReference> addmapping(
    String setname,
    String ar,
    String rr,
    String sar,
    String remainingpacks,
  ) async {
    return await mapping.add({
      'ar': ar,
      'Setname': setname,
      'rr': rr,
      'sar': sar,
      'remainingpacks': remainingpacks,
      'timestamp': Timestamp.now()
    });
  }
}
