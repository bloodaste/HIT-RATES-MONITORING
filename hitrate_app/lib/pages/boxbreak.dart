import 'package:flutter/material.dart';
import 'package:hitrate_app/components/bbnames.dart';

class Boxbreak extends StatefulWidget {
  const Boxbreak({super.key});

  @override
  State<Boxbreak> createState() => _BoxbreakState();
}

class _BoxbreakState extends State<Boxbreak> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Bbnames()));
          },
          child: Container(
            color: Colors.grey[300],
            child: Center(
              child: Text('Box break $index'),
            ),
          ),
        );
      },
    );
  }
}
