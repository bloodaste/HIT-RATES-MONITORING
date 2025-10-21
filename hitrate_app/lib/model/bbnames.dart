import 'dart:io';

import 'package:hitrate_app/provider/bbname.dart';

class Bbnamesmodel {
  final String setname;
  final Listofnames? buyersdets;
  final String totalpacks;
  final String? id;

  Bbnamesmodel({
    this.buyersdets,
    this.id,
    required this.totalpacks,
    required this.setname,
  });

  factory Bbnamesmodel.fromMap(Map<String, dynamic> e, {String? id}) {
    final buyersdeds = Listofnames.fromMap(e);
    return Bbnamesmodel(
      totalpacks: e['totalpacks'] ?? '',
      setname: e['setname'] ?? '',
      buyersdets: buyersdeds,
      id: id,
    );
  }
  Bbnamesmodel copywith({
    String? setname,
    Listofnames? buyersdeds,
    String? totalpacks,
    String? id,
  }) {
    return Bbnamesmodel(
      totalpacks: totalpacks ?? this.totalpacks,
      setname: setname ?? this.setname,
      id: id ?? this.id,
      buyersdets: buyersdeds ?? buyersdets,
    );
  }
}

class Nameclass {
  String index;
  String buyername;

  Nameclass({
    required this.index,
    required this.buyername,
  });

  factory Nameclass.fromMap(Map<String, dynamic> e) {
    return Nameclass(
      index: e['index'] ?? '0',
      buyername: e['buyername'] ?? '',
    );
  }

  Map<String, dynamic> tomap() {
    return {
      'index': index,
      'buyers': buyername,
    };
  }
}

class Listofnames {
  final List<Nameclass> listname;

  Listofnames({
    this.listname = const [],
  });

  factory Listofnames.fromMap(Map<String, dynamic> e) {
    return Listofnames(
      listname: (e['Listofnames'] is List)
          ? (e['Listofnames'] as List<dynamic>).map((item) {
              return Nameclass.fromMap(item as Map<String, dynamic>);
            }).toList()
          : [],
    );
  }

  Map<String, dynamic> tomap() {
    return {
      'Listofnames': listname.map((n) => n.tomap()).toList(),
    };
  }
}
