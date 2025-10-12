import 'package:flutter/material.dart';
import 'package:hitrate_app/firebase/hitsperbox.dart';

class Bbnames extends StatefulWidget {
  const Bbnames({super.key});

  @override
  State<Bbnames> createState() => _BbnamesState();
}

class _BbnamesState extends State<Bbnames> {
  Dbservice boxhit = Dbservice();
  List<bool> testing = List.generate(30, (index) => false);

  void add(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Name of the buyer'),
          content: TextField(),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('close'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  testing[index] = !testing[index];
                });
                Navigator.pop(context);
              },
              child: Text('add'),
            )
          ],
        );
      },
    );
  }

  void delete(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Name of the buyer'),
          content: Text('Are you want to delete?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('close'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  testing[index] = !testing[index];
                });
                Navigator.pop(context);
              },
              child: Text('Delete'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .25,
                  width: double.infinity,
                  color: Colors.red,
                  child: Image.network(
                    fit: BoxFit.cover,
                    'https://media.giphy.com/media/v1.Y2lkPWVjZjA1ZTQ3YW5zempodTc5aHp2c3kwbW96cXVjaHUzajFraDV3cnlxdHgzc3F1NSZlcD12MV9naWZzX3NlYXJjaCZjdD1n/U2nN0ridM4lXy/giphy.gif',
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Setname',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Column(
              children: [
                Text(
                  'Pick Your Ball',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Test you you luck by picking yours ball',
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  itemCount: 30,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        add(context, index);
                      },
                      onDoubleTap: () {
                        delete(context, index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: testing[index]
                                ? NetworkImage(
                                    'https://www.vhv.rs/dpng/d/3-31286_open-pokemon-ball-png-transparent-png.png',
                                  )
                                : NetworkImage(
                                    'https://pngimg.com/d/pokeball_PNG5.png',
                                  ),
                            fit: BoxFit.contain,
                          ),
                        ),
                        alignment: Alignment.topCenter,
                        child: testing[index]
                            ? Text(
                                'Buyers name ${index + 1}',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.fade),
                                textAlign: TextAlign.center,
                              )
                            : Text(
                                '$index',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.fade),
                                textAlign: TextAlign.center,
                              ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
