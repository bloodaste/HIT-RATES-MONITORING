import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hitrate_app/model/setname.dart';
import 'package:hitrate_app/outsourceAPI/pokemonfecthing.dart';

// Provider for fetching all Pokémon sets
final apiProviders = FutureProvider<List<Setname>>((ref) async {
  final api = APIservices();
  return await api.fetchset();
});

// Provider for fetching cards belonging to a specific set
final cardsProvider =
    FutureProvider.family<List<CardItem>, String>((ref, setId) async {
  final api = APIservices();
  return await api.fetchCardsBySet(setId);
});
