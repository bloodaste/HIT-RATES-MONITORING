class Quemodel {
  final String buyersname;
  final String refid;
  String? id;
 

  Quemodel({
    required this.buyersname,
    required this.refid,
    this.id,
  });

  factory Quemodel.fromMap(Map<String, dynamic> map) {
    return Quemodel(
      buyersname: map['buyername'] ?? '',
      refid: map['refid'] ?? '',
    );
  }

  Quemodel copyWith({
    String? id,
    String? buyersname,
    String? refid,
  }) {
    return Quemodel(
        buyersname: buyersname ?? this.buyersname,
        refid: refid ?? this.refid,
        id: id ?? this.id);
  }
}
