class Quemodel {
  final String buyersname;
  final String refid;
  String? id;
  int? status;

  Quemodel({
    required this.buyersname,
    required this.refid,
    this.id,
    this.status,
  });

  factory Quemodel.fromMap(Map<String, dynamic> map) {
    return Quemodel(
      buyersname: map['buyername'] ?? '',
      refid: map['refid'] ?? '',
      status: map['Status'],
    );
  }

  Quemodel copyWith(
      {String? id, String? buyersname, String? refid, int? statusfield}) {
    return Quemodel(
        buyersname: buyersname ?? this.buyersname,
        refid: refid ?? this.refid,
        status: statusfield ?? this.status,
        id: id ?? this.id);
  }
}
