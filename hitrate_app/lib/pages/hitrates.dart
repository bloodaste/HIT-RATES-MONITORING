import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hitrate_app/components/boxhit.dart';

import 'package:hitrate_app/components/formfieldforbb.dart';
import 'package:hitrate_app/model/hitsmodel.dart';
import 'package:hitrate_app/model/setname.dart';
import 'package:hitrate_app/provider/hitmap.dart';

class Hitrates extends ConsumerStatefulWidget {
  const Hitrates({super.key});

  @override
  ConsumerState<Hitrates> createState() => _HitratesState();
}

class _HitratesState extends ConsumerState<Hitrates> {
  final setname = Provider.autoDispose<TextEditingController>((ref) {
    final setname = TextEditingController();
    ref.onDispose(() {
      setname.dispose();
    });
    return setname;
  });
  final remainingpacks = Provider.autoDispose<TextEditingController>(
    //it autodispose when the textediting controller is no longeruse
    (ref) {
      final remaingpack = TextEditingController();
      ref.onDispose(() {
        remaingpack.dispose();
      });
      return remaingpack;
    },
  );
  void addingproduct(BuildContext context) async {
    final finalsetname = ref.watch(setname);
    final finalremaingpack = ref.watch(remainingpacks);
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add proudct'),
          content: Bbformfiel(
            setname: finalsetname,
            totalpacks: finalremaingpack,
          ),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                ref.read(hitmapProvider.notifier).addproduct(
                      Hitsmodel(
                        setname: finalsetname.text,
                        remainingpacks: int.parse(finalremaingpack.text),
                        cardset: Cardsname(
                          sr: [],
                          rr: [],
                          ar: [],
                        ),
                      ),
                    );
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('cancel'),
            )
          ],
        );
      },
    );
  }

  void delete(BuildContext context, Hitsmodel hits) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete product?'),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.pop(context);

                ref.read(hitmapProvider.notifier).deleteproduct(
                      hits.id!,
                    );
              },
              child: Text('Delete'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('cancel'),
            )
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final hp = ref.watch(hitmapProvider);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 10,
              ),
              child: TextFormField(
                onChanged: (value) {
                  ref.read(hitmapProvider.notifier).filterset(value);
                },
                decoration: InputDecoration(
                  label: Text('search for the set'),
                  prefixIcon: Icon(Icons.catching_pokemon),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: hp.isNotEmpty
                  ? GridView.builder(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: hp.length,
                      itemBuilder: (BuildContext context, int index) {
                        final hits = hp[index];
                        return GestureDetector(
                          onDoubleTap: () {},
                          onLongPress: () {
                            delete(context, hits);
                          },
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Names(
                                          setname: hp[index].setname,
                                          remainingpacks:
                                              hp[index].remainingpacks,
                                          id: hp[index].id!,
                                        )));
                          },
                          child: Container(
                            color: Colors.grey[200],
                            child: Center(
                              child: Text(hits.setname),
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        'No product declare',
                      ),
                    ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            addingproduct(context);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
