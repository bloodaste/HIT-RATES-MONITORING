import 'package:cloud_firestore/cloud_firestore.dart';

class Quedbservice {
  final CollectionReference queservice =
      FirebaseFirestore.instance.collection('currentque');

  Stream<QuerySnapshot> getservice() {
    return queservice.orderBy('timestamp', descending: false).snapshots();
  }

  Future<void> deletingq(String queid) async {
    return await queservice.doc(queid).delete();
  }

  Future<void> updateque(
    String id,
    String refid,
    String buyername,
  ) async {
    return await queservice.doc(id).update({
      'buyername': buyername,
      'refid': refid,
    });
  }

  Future<DocumentReference> addque(
    String buyername,
    String refid,
  ) async {
    return await queservice.add(
      {
        'buyername': buyername,
        'Status': 1,
        'refid': refid,
        'timestamp': Timestamp.now(),
      },
    );
  }

  Future<void> updatedelete(String id) async {
    return await queservice.doc(id).update(
      {'Status': 0},
    );
  }
}
