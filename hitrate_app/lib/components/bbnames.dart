import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hitrate_app/components/formfield.dart';
import 'package:hitrate_app/firebase/hitsperbox.dart';
import 'package:hitrate_app/model/bbnames.dart';
import 'package:hitrate_app/provider/bbname.dart';
import 'package:http/http.dart';

class Bbnames extends ConsumerStatefulWidget {
  final Bbnamess datas;
  const Bbnames({
    super.key,
    required this.datas,
  });

  @override
  ConsumerState<Bbnames> createState() => _BbnamesState();
}

class _BbnamesState extends ConsumerState<Bbnames> {
  TextEditingController buyersname = TextEditingController();
  TextEditingController slot = TextEditingController();

  void deletenames(Nameconfig delvale, String id) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('Are you sure want to delete ${delvale.buyername} '),
            actions: [
              TextButton(
                onPressed: () {
                  ref.read(bbnameProvider.notifier).deletelist(delvale, id);
                  Navigator.pop(context);
                },
                child: Text('Delete'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('close'),
              ),
            ],
          );
        });
  }

  void addnames(BuildContext context, String index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Name of the buyer'),
          content: TextFormField(
            controller: buyersname,
          ),
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
                  ref.read(bbnameProvider.notifier).addbuyers(
                        Nameconfig(
                          buyername: buyersname.text,
                          slot: index.toString(),
                        ),
                        widget.datas.id!,
                      );
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

  // void delete(BuildContext context, int index) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Name of the buyer'),
  //         content: Text('Are you want to delete?'),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //             child: Text('close'),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               setState(() {
  //                 testing[index] = !testing[index];
  //               });
  //               Navigator.pop(context);
  //             },
  //             child: Text('Delete'),
  //           )
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final boxbreaks = ref.watch(bbnameProvider);

    final currentBox = boxbreaks.firstWhere(
      (b) => b.id == widget.datas.id,
    );

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
                        widget.datas.setname,
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
                  itemCount: int.tryParse(widget.datas.packs),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final slotNumber = (index + 1).toString();

                    final name = currentBox.names.names.firstWhere(
                      (e) => e.slot == slotNumber,
                      orElse: () => Nameconfig(
                        buyername: '',
                        slot: '',
                      ),
                    );

                    final isMatched = name.buyername.isNotEmpty;

                    return GestureDetector(
                      onTap: () {
                        addnames(context, slotNumber);
                      },
                      onDoubleTap: () {
                        deletenames(
                            currentBox.names.names[index], currentBox.id!);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: isMatched
                                ? NetworkImage(
                                    'https://www.vhv.rs/dpng/d/3-31286_open-pokemon-ball-png-transparent-png.png')
                                : NetworkImage(
                                    'https://cdn-icons-png.flaticon.com/512/188/188918.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                        alignment: Alignment.topCenter,
                        child: isMatched
                            ? Center(
                                child: Text(
                                  name.buyername,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.fade),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : Text(
                                '${index + 1}',
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
