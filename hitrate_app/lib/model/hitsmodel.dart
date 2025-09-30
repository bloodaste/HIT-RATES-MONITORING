class Hitsmodel {
  final String? id;
  final String setname;
  final String ar;
  final String rr;
  final String sar;
  final String remainingpacks;

  Hitsmodel({
    this.id,
    required this.setname,
    required this.ar,
    required this.rr,
    required this.sar,
    required this.remainingpacks,
  });

  factory Hitsmodel.fromJson(Map<String, dynamic> json) {
    return Hitsmodel(
      setname: json['Setname'] ?? '',
      ar: json['ar'] ?? '',
      rr: json['rr'] ?? '',
      sar: json['sar'] ?? '',
      remainingpacks: json['remainingpacks'] ?? '',
    );
  }

  Hitsmodel copyWith({
    String? id,
    String? setname,
    String? ar,
    String? rr,
    String? sar,
    String? remainingpacks,
  }) {
    return Hitsmodel(
      id: id ?? this.id,
      setname: setname ?? this.setname,
      ar: ar ?? this.ar,
      rr: rr ?? this.rr,
      sar: sar ?? this.sar,
      remainingpacks: remainingpacks ?? this.remainingpacks,
    );
  }
}
