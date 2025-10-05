class Setname {
  final String set;
  final String partset;
  final Images img;
  final String id;

  Setname({
    required this.id,
    required this.img,
    required this.partset,
    required this.set,
  });

  factory Setname.fromJson(Map<String, dynamic> json) {
    return Setname(
      id: json['id'] ?? '',
      set: json['name'] ?? '',
      partset: json['series'] ?? '',
      img: Images.fromJson(json['images'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': set,
      'series': partset,
      'images': img.toJson(),
    };
  }
}

class Images {
  final String symbol;
  final String logo;

  Images({required this.logo, required this.symbol});

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      symbol: json['symbol'] ?? '',
      logo: json['logo'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'logo': logo,
    };
  }
}

class CardItem {
  final String id;
  final String name;
  final String imageUrl;

  CardItem({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory CardItem.fromJson(Map<String, dynamic> json) {
    return CardItem(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      imageUrl: json['images']?['small'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'imageUrl': imageUrl,
      };
}
