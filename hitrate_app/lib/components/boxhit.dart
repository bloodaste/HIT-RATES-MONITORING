import 'package:flutter/material.dart';

class Names extends StatefulWidget {
  final int currentindex;
  const Names({super.key, required this.currentindex});

  @override
  State<Names> createState() => _NamesState();
}

class _NamesState extends State<Names> {
  String? filterset;

  List setname = [
    'Crimson haze',
    'triple beat',
    'paradise dragona',
    'wala nakong maisip'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  child: Image.network(
                      'https://tcg.pokemon.com/assets/img/sv-expansions/twilight-masquerade/logo/en-us/sv6-logo.png'),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hits taken',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  DropdownButton(
                      hint: Text('Filter by name'),
                      value: filterset,
                      items: setname.map((e) {
                        return DropdownMenuItem(value: e, child: Text(e));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          filterset = value.toString();
                        });
                      })
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.grey[100],
                      child: Text(
                        'Sr/Sar: 1',
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'Ar: 2',
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'Ex/RR: 4',
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'Packs left: 20',
                        softWrap: true,
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
