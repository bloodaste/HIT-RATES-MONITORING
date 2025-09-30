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
            Stack(
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
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Container(
                      padding: EdgeInsets.all(40),
                      child: Text('$index'),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
