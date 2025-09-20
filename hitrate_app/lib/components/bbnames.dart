import 'package:flutter/material.dart';

class Bbnames extends StatefulWidget {
  const Bbnames({super.key});

  @override
  State<Bbnames> createState() => _BbnamesState();
}

class _BbnamesState extends State<Bbnames> {
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
                  'Box Break Names',
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
            Center(
              child: Text(
                'Box Break!',
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
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
                        onLongPress: () {
                          delete(context);
                        },
                        onTap: () {
                          add(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${index + 1} Pack Number: ',
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Name',
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ));
                  },
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

void add(BuildContext context) {
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
            onPressed: () {},
            child: Text('add'),
          )
        ],
      );
    },
  );
}

void delete(BuildContext context) {
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
            onPressed: () {},
            child: Text('Delete'),
          )
        ],
      );
    },
  );
}
