import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Names extends StatefulWidget {
  final String sar;
  final String ar;
  final String rr;
  final String remainingpacks;
  final int currentindex;
  final String setname;
  const Names(
      {super.key,
      required this.currentindex,
      required this.sar,
      required this.ar,
      required this.rr,
      required this.setname,
      required this.remainingpacks});

  @override
  State<Names> createState() => _NamesState();
}

class _NamesState extends State<Names> {
  String? filterset;
  bool showset = false;
  List setname = [
    'Crimson haze',
    'triple beat',
    'paradise dragona',
    'wala nakong maisip'
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
        body: SingleChildScrollView(
          child: Column(
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
                      widget.setname,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Sr/Sar: ${widget.sar}',
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
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
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Ar: \n ${widget.ar}',
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
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
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Ex/RR:\n ${widget.rr}',
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
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
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Packs: \n ${widget.remainingpacks}',
                          softWrap: true,
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      'Hits been Taken',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 100,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _showImageDialog(
                          context,
                          'https://i.redd.it/yz2vct4sz4ja1.jpg',
                        );
                      },
                      child: Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 5),
                        child: Image.network(
                          'https://i.redd.it/yz2vct4sz4ja1.jpg',
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      'Cards in The set',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showset = !showset;
                  });
                },
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 3,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Row(
                        children: [
                          Text('Card list in set'),
                          showset
                              ? Icon(
                                  Icons.arrow_upward,
                                  size: 18,
                                )
                              : Icon(
                                  Icons.arrow_downward,
                                  size: 18,
                                ),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 3,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              showset
                  ? GridView.builder(
                      shrinkWrap: true,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(
                            'https://static.tcgcollector.com/content/images/5d/4c/6b/5d4c6b4228d8a8428b3662a678a6af63b844ada46df8f860b5638ec67df45114.webp');
                      },
                    )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
