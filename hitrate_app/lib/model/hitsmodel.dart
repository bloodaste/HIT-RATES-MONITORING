import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Hitsmodel {
  final String? id;
  final String setname;
  final String ar;
  final String rr;
  final String sar;
  final String remainingpacks;
  final Cardsname cardset;

  Hitsmodel({
    this.id,
    required this.setname,
    required this.ar,
    required this.rr,
    required this.sar,
    required this.remainingpacks,
    required this.cardset,
  });

  /// ✅ Convert Firestore map → Dart object
  factory Hitsmodel.fromJson(Map<String, dynamic> json, {String? id}) {
    return Hitsmodel(
      id: id,
      setname: json['Setname'] ?? '',
      ar: json['ar'] ?? '',
      rr: json['rr'] ?? '',
      sar: json['sar'] ?? '',
      remainingpacks: json['remainingpacks'] ?? '',
      cardset:
          json['card'] != null ? Cardsname.fromMap(json['card']) : Cardsname(),
    );
  }

  /// ✅ Convert Dart object → Firestore map
  Map<String, dynamic> toMap() {
    return {
      'Setname': setname,
      'ar': ar,
      'rr': rr,
      'sar': sar,
      'remainingpacks': remainingpacks,
      'timestamp': Timestamp.now(),
      'card': cardset.toMap(), // 🔥 This ensures your nested object structure
    };
  }

  Hitsmodel copyWith({
    String? id,
    String? setname,
    String? ar,
    String? rr,
    String? sar,
    String? remainingpacks,
    Cardsname? cardset,
  }) {
    return Hitsmodel(
      id: id ?? this.id,
      setname: setname ?? this.setname,
      ar: ar ?? this.ar,
      rr: rr ?? this.rr,
      sar: sar ?? this.sar,
      remainingpacks: remainingpacks ?? this.remainingpacks,
      cardset: cardset ?? this.cardset,
    );
  }
}

class Cardsname {
  final List<dynamic> sr;
  final List<dynamic> ar;
  final List<dynamic> rr;

  Cardsname({
    this.sr = const [],
    this.ar = const [],
    this.rr = const [],
  });

  /// ✅ Convert nested Firestore map → Dart object
  factory Cardsname.fromMap(Map<String, dynamic> map) {
    return Cardsname(
      sr: List<dynamic>.from(map['Sr'] is List ? map['Sr'] : [map['Sr'] ?? []]),
      ar: List<dynamic>.from(map['AR'] ?? []),
      rr: List<dynamic>.from(map['RR'] ?? []),
    );
  }

  /// ✅ Convert Dart object → Firestore map
  Map<String, dynamic> toMap() {
    return {
      'Sr': sr,
      'AR': ar,
      'RR': rr,
    };
  }
}
