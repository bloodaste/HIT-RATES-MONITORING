import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hitrate_app/model/setname.dart';

class APIservices {
  /// Fetch all Pokémon TCG sets
  Future<List<Setname>> fetchset() async {
    const url = 'https://api.pokemontcg.io/v2/sets';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List data = jsonData['data'];

      return data.map((item) => Setname.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load sets');
    }
  }

  /// Fetch cards for a specific set
  Future<List<CardItem>> fetchCardsBySet(String setId) async {
    final url = 'https://api.pokemontcg.io/v2/cards?q=set.id:$setId';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List cardsData = jsonData['data'];

      return cardsData.map((card) => CardItem.fromJson(card)).toList();
    } else {
      throw Exception('Failed to load cards for set $setId');
    }
  }
}
