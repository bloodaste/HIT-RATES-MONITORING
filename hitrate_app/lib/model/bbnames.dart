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
    );
  }
}

class Nameclass {
  int index;
  String buyername;

  Nameclass({
    required this.index,
    required this.buyername,
  });
}

class Listofnames {
  final List<Nameclass> listname;

  Listofnames({
    this.listname = const [],
  });

  factory Listofnames.fromMap(Map<String, dynamic> e) {
    return Listofnames(
      listname: List<Nameclass>.from(
        e['Listofnames'],
      ),
    );
  }

  Map<String, dynamic> tomap() {
    return {
      'Listofnames': listname,
    };
  }
}
