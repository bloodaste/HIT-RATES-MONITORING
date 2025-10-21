import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hitrate_app/model/bbnames.dart';

class Boxbreakservice {
  final CollectionReference bbname =
      FirebaseFirestore.instance.collection('boxbreak');

  Stream<QuerySnapshot> getnames() {
    return bbname.orderBy('timestamp', descending: true).snapshots();
  }

  Future<DocumentReference> addname(
    String setname,
    String totalpacks,
    Listofnames buyersdetails,
  ) async {
    return await bbname.add({
      'Listofnames': buyersdetails.tomap(),
      'setname': setname,
      'totalpacks': totalpacks,
      'timestamp': Timestamp.now()
    });
  }

  Future<void> updatebb(
    String setname,
    String totalpacks,
    Listofnames buyersdetails,
    String id,
  ) async {
    return await bbname.doc(id).update({
      'Listofnames': buyersdetails.tomap(),
      'setname': setname,
      'totalpacks': totalpacks,
    });
  }

  Future<void> deletename(String id) async {
    return await bbname.doc(id).delete();
  }
}
