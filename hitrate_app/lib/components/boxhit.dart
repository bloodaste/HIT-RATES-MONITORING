import 'package:flutter/material.dart';

class Names extends StatefulWidget {
  final int currentindex;
  const Names({super.key, required this.currentindex});

  @override
  State<Names> createState() => _NamesState();
}

class _NamesState extends State<Names> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 150,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Set Name or Box name ${widget.currentindex} ',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.08,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Text(
                    'Double Rare: 10',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Container(
                  child: Text(
                    'Ar: 10',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Container(
                  child: Text(
                    'Sr: 10',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Container(
                  child: Text(
                    'Pack Remaining: 20',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // two columns
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 20,
                    childAspectRatio:
                        2.5, // width/height ratio for better alignment
                  ),
                  itemCount: 30, // total numbers
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onDoubleTap: () {
                        print('pack $index been clicked');
                      },
                      child: Container(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${index + 1} hit of the pack:",
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "HOLO",
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
