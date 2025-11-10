import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hitrate_app/components/bbnames.dart';
import 'package:hitrate_app/components/formfield.dart';
import 'package:hitrate_app/model/bbnames.dart';
import 'package:hitrate_app/provider/bbname.dart';
import 'package:http/http.dart';

class Boxbreak extends ConsumerStatefulWidget {
  const Boxbreak({super.key});

  @override
  ConsumerState<Boxbreak> createState() => _BoxbreakState();
}

class _BoxbreakState extends ConsumerState<Boxbreak> {
  TextEditingController setname = TextEditingController();
  TextEditingController totalpacks = TextEditingController();
  bool testing = false;

  void deletedialog(BuildContext context, String id) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete this boxbreak'),
          actions: [
            TextButton(
              onPressed: () async {
                ref.read(bbnameProvider.notifier).deleteboxbrek(id);
                setname.dispose();
                totalpacks.dispose();
                Navigator.pop(context);
              },
              child: Text('delete'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
              },
              child: Text('cancel'),
            ),
          ],
        );
      },
    );
  }

  void addboxbreak() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Add box for box break'),
            content: Queform(
              firstfield: 'Name of the set',
              controller: setname,
              seconfield: 'Total packs',
              controller2: totalpacks,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  ref.read(bbnameProvider.notifier).addcard(
                        Bbnamess(
                          packs: totalpacks.text,
                          setname: setname.text,
                          names: Namelist(
                            names: [],
                          ),
                        ),
                      );
                  setname.dispose();
                  totalpacks.dispose();
                  Navigator.pop(context);
                },
                child: Text('Add'),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final names = ref.watch(bbnameProvider);
    return Scaffold(
      body: SafeArea(
          child: Column(
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
                ref.read(bbnameProvider.notifier).filter(value);
              },
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
          names.isEmpty
              ? Expanded(
                  child: Center(
                    child: Text('Currently there is no box break'),
                  ),
                )
              : Expanded(
                  child: GridView.builder(
                    itemCount: names.length,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onLongPress: () {
                          deletedialog(context, names[index].id!);
                        },
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Bbnames(
                                  datas: names[index],
                                ),
                              ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  names[index].setname,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addboxbreak();
        },
      ),
    );
  }
}
