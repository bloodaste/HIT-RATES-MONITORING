import 'package:flutter/material.dart';
import 'package:hitrate_app/components/boxhit.dart';

class Hitrates extends StatefulWidget {
  const Hitrates({super.key});

  @override
  State<Hitrates> createState() => _HitratesState();
}

class _HitratesState extends State<Hitrates> {
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Names(
                          currentindex: index,
                        )));
          },
          child: Container(
            color: Colors.grey[200],
            child: Center(
              child: Text('Box hits $index'),
            ),
          ),
        );
      },
    );
  }
}
