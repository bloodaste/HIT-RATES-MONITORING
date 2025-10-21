import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hitrate_app/components/bbnames.dart';
import 'package:hitrate_app/model/bbnames.dart';
import 'package:hitrate_app/provider/bbname.dart';

class Boxbreak extends ConsumerStatefulWidget {
  const Boxbreak({super.key});

  @override
  ConsumerState<Boxbreak> createState() => _BoxbreakState();
}

class _BoxbreakState extends ConsumerState<Boxbreak> {
  TextEditingController setname = TextEditingController();
  TextEditingController totalpacks = TextEditingController();

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
                  ))
                : Expanded(
                    child: GridView.builder(
                        itemCount: names.length,
                        addAutomaticKeepAlives: false,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Bbnames(),
                                ),
                              );
                            },
                            child: Container(
                              color: Colors.grey,
                            ),
                          );
                        }),
                  ),
            TextButton(
                onPressed: () {
                  print(names.length);
                },
                child: Text('sasada'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        ref.read(bbnameProvider.notifier).addproduct(
              Bbnamesmodel(
                totalpacks: 'testing1',
                setname: 'testing 2',
                buyersdets: Listofnames(
                  listname: [
                    Nameclass(index: '2', buyername: 'testing 1'),
                  ],
                ),
              ),
            );
      }),
    );
  }
}
