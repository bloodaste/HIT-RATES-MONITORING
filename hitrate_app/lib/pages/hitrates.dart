import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hitrate_app/components/boxhit.dart';
import 'package:hitrate_app/components/formfield.dart';
import 'package:hitrate_app/model/hitsmodel.dart';
import 'package:hitrate_app/provider/hitmap.dart';

class Hitrates extends ConsumerStatefulWidget {
  const Hitrates({super.key});

  @override
  ConsumerState<Hitrates> createState() => _HitratesState();
}

class _HitratesState extends ConsumerState<Hitrates> {
  TextEditingController setname = TextEditingController();
  TextEditingController ar = TextEditingController();
  TextEditingController sr = TextEditingController();
  TextEditingController remaingpacks = TextEditingController();
  TextEditingController rr = TextEditingController();

  void addingproduct(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add proudct'),
          content: Formfield(
            setname: setname,
            ar: ar,
            sr: sr,
            rr: rr,
            remainingpacks: remaingpacks,
          ),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                ref.read(hitmapProvider.notifier).addproduct(
                      Hitsmodel(
                        setname: setname.text,
                        ar: ar.text,
                        rr: rr.text,
                        sar: sr.text,
                        remainingpacks: remaingpacks.text,
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
  void dispose() {
    setname.dispose();
    ar.dispose();
    rr.dispose();
    sr.dispose();
    remaingpacks.dispose();
    super.dispose();
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
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: hp.length,
                      itemBuilder: (BuildContext context, int index) {
                        final hits = hp[index];
                        return GestureDetector(
                          onLongPress: () {
                            delete(context, hits);
                          },
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Names(
                                          setname: hp[index].setname,
                                          currentindex: index,
                                          sar: hp[index].sar,
                                          ar: hp[index].ar,
                                          rr: hp[index].rr,
                                          remainingpacks:
                                              hp[index].remainingpacks,
                                          srlist: hp[index].cardset.ar,
                                          arlist: hp[index].cardset.sr,
                                          rrlist: hp[index].cardset.rr,
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
