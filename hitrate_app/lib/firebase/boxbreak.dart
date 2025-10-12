import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hitrate_app/model/bbnames.dart';

class Boxbreakservice {
  final CollectionReference bbname =
      FirebaseFirestore.instance.collection('boxbreak');

  Stream<QuerySnapshot> getnames() {
    return bbname.orderBy('timestamp', descending: true).snapshots();
  }

  Future<void> addname() async {}
}
