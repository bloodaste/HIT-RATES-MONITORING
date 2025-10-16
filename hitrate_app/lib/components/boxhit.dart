import 'package:flutter/material.dart';

class Names extends StatefulWidget {
  final String sar;
  final String ar;
  final String rr;
  final String remainingpacks;
  final int currentindex;
  final String setname;

  const Names({
    super.key,
    required this.currentindex,
    required this.sar,
    required this.ar,
    required this.rr,
    required this.setname,
    required this.remainingpacks,
  });

  @override
  State<Names> createState() => _NamesState();
}

class _NamesState extends State<Names> {
  String? filterset;
  bool showset = false;

  final List<String> setname = [
    'Crimson Haze',
    'Triple Beat',
    'Paradise Dragona',
    'Twilight Masquerade',
  ];

  void _showImageDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Name of the card"),
          content: Image.network(imageUrl),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuK5GHlKVD_oqsVNOFI2WoeYGYzyjJxGmXQw&s',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // --- Gradient overlay for readability ---
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.transparent
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 16,
                    left: 16,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: -80,
                    left: 20,
                    right: 16,
                    child: Card(
                      color: Colors.white,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuK5GHlKVD_oqsVNOFI2WoeYGYzyjJxGmXQw&s',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Hits Pulled",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoCard('SR', widget.sar.toString()),
                        _buildInfoCard('AR', widget.ar.toString()),
                        _buildInfoCard('RR', widget.rr.toString()),
                        _buildInfoCard('Remaining Packs',
                            widget.remainingpacks.toString()),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildCardListSection("SAR/SR", Colors.amber[100]!),
                    _buildCardListSection("Art Rare", Colors.lightBlue[100]!),
                    _buildCardListSection("EX / RR", Colors.green[100]!),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ===========================
  // Helper Widget for card list
  // ===========================
  Widget _buildCardListSection(String title, Color bgColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Column(
          children: List.generate(
            3,
            (index) => Card(
              color: bgColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: ListTile(
                title: const Text("Name of the card"),
                trailing: const Icon(Icons.catching_pokemon),
                onTap: () {
                  _showImageDialog(
                    context,
                    'https://upload.wikimedia.org/wikipedia/en/9/9a/Pok%C3%A9mon_TCG_logo.svg',
                  );
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

Widget _buildInfoCard(String title, String value) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    decoration: BoxDecoration(
      color: Colors.blueAccent.withOpacity(0.2),
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.blueAccent.withOpacity(0.2),
          blurRadius: 8,
          offset: const Offset(2, 4),
        ),
      ],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.blueAccent,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
