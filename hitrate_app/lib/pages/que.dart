import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hitrate_app/provider/outsources.dart';

class Que extends ConsumerWidget {
  const Que({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 🧪 Hardcode Twilight Masquerade set ID for testing
    const testSetId = "sv6"; // Twilight Masquerade
    final asyncCards = ref.watch(cardsProvider(testSetId));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Twilight Masquerade Cards"),
        centerTitle: true,
      ),
      body: asyncCards.when(
        data: (cards) {
          if (cards.isEmpty) {
            return const Center(child: Text("No cards found for this set."));
          }
          return GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: cards.length,
            itemBuilder: (context, index) {
              final card = cards[index];
              return Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        card.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            const Icon(Icons.broken_image, size: 50),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    card.name,
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
