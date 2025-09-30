import 'package:flutter/material.dart';
import 'package:hitrate_app/components/boxhit.dart';
import 'package:hitrate_app/components/formfield.dart';
import 'package:hitrate_app/firebase/hitsperbox.dart';
import 'package:hitrate_app/model/hitsmodel.dart';

class Hitrates extends StatefulWidget {
  const Hitrates({super.key});

  @override
  State<Hitrates> createState() => _HitratesState();
}

class _HitratesState extends State<Hitrates> {
  TextEditingController setname = TextEditingController();
  TextEditingController ar = TextEditingController();
  TextEditingController sr = TextEditingController();
  TextEditingController reamingingpacks = TextEditingController();
  TextEditingController rr = TextEditingController();
  List<Hitsmodel> hitrates = [];
  Dbservice hitrate = Dbservice();
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
            remainingpacks: reamingingpacks,
          ),
          actions: [
            TextButton(
              onPressed: () async {
                await hitrate.addmapping(
                  setname.text,
                  ar.text,
                  rr.text,
                  sr.text,
                  reamingingpacks.text,
                );
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                print(hitrates.length);
                fetchhits();
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
    reamingingpacks.dispose();
    super.dispose();
  }

  void fetchhits() {
    hitrate.gethits().listen((snapshot) {
      List<Hitsmodel> templist = [];

      for (var doc in snapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        templist.add(
          Hitsmodel(
            ar: data['ar'] ?? '',
            sar: data['sr'] ?? '',
            remainingpacks: data['remainingpacks'] ?? '',
            rr: data['rr'] ?? '',
            setname: data['setname'] ?? '',
          ),
        );
      }

      hitrates = templist;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchhits();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: hitrates.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Names(
                                    currentindex: index,
                                  )));
                    },
                    child: Container(
                      color: Colors.grey[200],
                      child: Center(
                        child: Text('Box hits $index'),
                      ),
                    ),
                  );
                },
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
