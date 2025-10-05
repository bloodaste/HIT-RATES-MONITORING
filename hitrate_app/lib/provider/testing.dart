import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hitrate_app/model/setname.dart';
import 'package:hitrate_app/outsourceAPI/pokemonfecthing.dart';

// Simple FutureProvider, no need for class boilerplate
final apiProviders = FutureProvider<List<Setname>>((ref) async {
  final api = APIservices();
  return await api.fetchset();
});
