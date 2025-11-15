class Bbnamess {
  final String setname;
  final String? id;
  final String packs;
  final Namelist names;
  Bbnamess({
    this.id,
    required this.packs,
    required this.setname,
    required this.names,
  });

  Bbnamess copywith({
    String? setname,
    String? id,
    String? packs,
    Namelist? names,
  }) {
    return Bbnamess(
      id: id ?? this.id,
      packs: packs ?? this.packs,
      setname: setname ?? this.setname,
      names: names ?? this.names,
    );
  }

  factory Bbnamess.frommap(Map<String, dynamic> name, {String? id}) {
    final nameslist = Namelist.frommap(name);
    return Bbnamess(
      setname: name['setname'],
      packs: name['totalpacks'],
      id: id,
      names: nameslist,
    );
  }

  Map<String, dynamic> tomap() {
    return {
      'setname': setname,
      'totalpacks': packs,
    };
  }
}

class Nameconfig {
  final String buyername;
  final String slot;

  Nameconfig({
    required this.buyername,
    required this.slot,
  });

  factory Nameconfig.frommap(Map<String, dynamic> nameconfig) {
    return Nameconfig(
      buyername: nameconfig['Name'],
      slot: nameconfig['Slot'],
    );
  }
  Map<String, dynamic> tomap() {
    return {
      'Name': buyername,
      'Slot': slot,
    };
  }
}

class Namelist {
  final List<Nameconfig> names;

  Namelist({this.names = const []});
  factory Namelist.frommap(Map<String, dynamic> namelist) {
    try {
      // Step 1: get the nested field properly
      final buyersInfo = namelist['buyersinfo'];
      if (buyersInfo == null || buyersInfo['buyers'] == null) {
        return Namelist(names: []);
      }

      final buyers = buyersInfo['buyers'] as List<dynamic>;

      // Step 2: convert each map to Nameconfig
      final namesList = buyers.map((e) {
        return Nameconfig.frommap(e as Map<String, dynamic>);
      }).toList();

      return Namelist(names: namesList);
    } catch (e) {
      print('Error in Namelist.frommap: $e');
      return Namelist(names: []);
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'buyers': names.map((e) => e.tomap()).toList(),
    };
  }
}
