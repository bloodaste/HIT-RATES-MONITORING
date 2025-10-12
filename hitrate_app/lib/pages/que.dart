import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hitrate_app/provider/outsources.dart';

class Que extends ConsumerWidget {
  const Que({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 🧪 Hardcode Twilight Masquerade set ID for testing

    return Scaffold(
      appBar: AppBar(
        title: const Text("Twilight Masquerade Cards"),
        centerTitle: true,
      ),
      body: Text('QUE'),
    );
  }
}
