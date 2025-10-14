class Quemodel {
  final String buyersname;
  final String refid;

  Quemodel({
    required this.buyersname,
    required this.refid,
  });

  factory Quemodel.fromMap(Map<String, dynamic> map) {
    return Quemodel(
      buyersname: map['buyersname'] ?? '',
      refid: map['refid'] ?? '',
    );
  }

  // (Optional) for writing back to Firestore
  Map<String, dynamic> toMap() {
    return {
      'buyersname': buyersname,
      'refid': refid,
    };
  }
}
