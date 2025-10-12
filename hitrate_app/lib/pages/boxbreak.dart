import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hitrate_app/components/bbnames.dart';
import 'package:hitrate_app/components/formfieldforbb.dart';
import 'package:hitrate_app/firebase/boxbreak.dart';
import 'package:hitrate_app/model/bbnames.dart';

class Boxbreak extends StatefulWidget {
  const Boxbreak({super.key});

  @override
  State<Boxbreak> createState() => _BoxbreakState();
}

class _BoxbreakState extends State<Boxbreak> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: 10,
          ),
          child: TextFormField(
            decoration: InputDecoration(
                label: Text('For The box'),
                prefixIcon: Icon(Icons.catching_pokemon),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0))),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: GridView.builder(
              itemCount: 30,
              addAutomaticKeepAlives: false,
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Bbnames()));
                  },
                  child: Container(
                    color: Colors.grey,
                  ),
                );
              }),
        ),
      ],
    )));
  }
}
