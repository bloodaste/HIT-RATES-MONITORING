import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hitrate_app/provider/hitmap.dart';

class Names extends ConsumerStatefulWidget {
  final int remainingpacks;

  final String setname;
  final String id;
  const Names(
      {super.key,
      required this.setname,
      required this.remainingpacks,
      required this.id});

  @override
  ConsumerState<Names> createState() => _NamesState();
}

class _NamesState extends ConsumerState<Names> {
  String? filterset;
  bool showset = false;
  TextEditingController setname = TextEditingController();
  TextEditingController card = TextEditingController();

  void addingcard(BuildContext context, String id, String type, int value) {
    showDialog(
      context: context,
      builder: (
        BuildContext context,
      ) {
        if (value != 0) {
          return AlertDialog(
            title: Text(type),
            content: TextField(
              controller: card,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  ref.read(hitmapProvider.notifier);
                },
                child: const Text("Add"),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Close"),
              ),
            ],
          );
        }

        return AlertDialog(
          content: Text('There is no Remaining Packs'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            )
          ],
        );
      },
    );
  }

  void deletecard(
      BuildContext context, String id, String type, String nameofcard) {
    showDialog(
      context: context,
      builder: (
        BuildContext context,
      ) {
        return AlertDialog(
          title: Text('Are you you sure you want to delete $nameofcard'),
          actions: [
            TextButton(
              onPressed: () {
                ref
                    .read(hitmapProvider.notifier)
                    .removecard(id, nameofcard, type);
                if (context.mounted) {
                  Navigator.pop(context);
                }
              },
              child: const Text("Delete"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  // void update(BuildContext context, Hitsmodel hits) async {
  //   return showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('update product'),
  //         content: Formfield(
  //           setname: setname,
  //           ar: ar,
  //           sr: sr,
  //           rr: rr,
  //           remainingpacks: remaingpacks,
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () async {
  //               final updatedHit = hits.copyWith(
  //                 setname:
  //                     setname.text.isNotEmpty ? setname.text : hits.setname,
  //                 ar: ar.text.isNotEmpty ? ar.text : hits.ar,
  //                 rr: rr.text.isNotEmpty ? rr.text : hits.rr,
  //                 sar: sr.text.isNotEmpty ? sr.text : hits.sar,
  //                 remainingpacks: remaingpacks.text.isNotEmpty
  //                     ? remaingpacks.text
  //                     : hits.remainingpacks,
  //               );
  //               Navigator.pop(context);
  //               ref.read(hitmapProvider).add(updatedHit);
  //             },
  //             child: Text('update'),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //             child: Text('cancel'),
  //           )
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final hitmapState = ref.watch(hitmapProvider);
    final hit = hitmapState.firstWhere(
      (h) => h.id == widget.id,
    );

    final srList = hit.cardset.sr;
    final arList = hit.cardset.ar;
    final rrlist = hit.cardset.rr;
    final remainingapacks = hit.remainingpacks;

    final packlelf =
        remainingapacks - (srList.length + arList.length + rrlist.length);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuK5GHlKVD_oqsVNOFI2WoeYGYzyjJxGmXQw&s',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // --- Gradient overlay for readability ---
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.transparent
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 16,
                    left: 16,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: -80,
                    left: 20,
                    right: 16,
                    child: Card(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuK5GHlKVD_oqsVNOFI2WoeYGYzyjJxGmXQw&s',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Hits Pulled",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueAccent.withOpacity(0.2),
                                blurRadius: 8,
                                offset: const Offset(2, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Sr',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blueAccent,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                srList.length.toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueAccent.withOpacity(0.2),
                                blurRadius: 8,
                                offset: const Offset(2, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Ar',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blueAccent,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                arList.length.toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent[100],
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueAccent,
                                blurRadius: 8,
                                offset: const Offset(2, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'RR',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blueAccent,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                rrlist.length.toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueAccent.withOpacity(0.2),
                                blurRadius: 8,
                                offset: const Offset(2, 4),
                              ),
                            ],
                          ),
                          child: GestureDetector(
                            onTap: () {
                              ref
                                  .read(hitmapProvider.notifier)
                                  .minus(widget.id, packlelf);
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Remaing Packs',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blueAccent,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 4),
                                GestureDetector(
                                  child: Text(
                                    '${remainingapacks - (arList.length + srList.length + rrlist.length)}',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'SR/SAR',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                onPressed: () {
                                  addingcard(
                                      context, widget.id, 'Sr', packlelf);
                                },
                                icon: Icon(Icons.add))
                          ],
                        ),
                        srList.isEmpty
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Currently no hit',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                children: srList.map((e) {
                                  return Card(
                                    color: Colors.amber[100],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child: ListTile(
                                      title: Text(e),
                                      trailing:
                                          const Icon(Icons.catching_pokemon),
                                      onLongPress: () {
                                        deletecard(context, widget.id, 'Sr', e);
                                      },
                                    ),
                                  );
                                }).toList(),
                              ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'AR',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                onPressed: () {
                                  addingcard(
                                      context, widget.id, 'AR', packlelf);
                                },
                                icon: Icon(Icons.add))
                          ],
                        ),
                        arList.isEmpty
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Currently no hit',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                children: arList.map((e) {
                                  return Card(
                                    color: Colors.blue[100],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child: ListTile(
                                      title: Text(e),
                                      trailing:
                                          const Icon(Icons.catching_pokemon),
                                      onTap: () {
                                        deletecard(context, widget.id, 'AR', e);
                                      },
                                    ),
                                  );
                                }).toList(),
                              ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'RR',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                onPressed: () {
                                  addingcard(
                                      context, widget.id, 'RR', packlelf);
                                },
                                icon: Icon(Icons.add))
                          ],
                        ),
                        rrlist.isEmpty
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Currently no hit',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                children: rrlist.map((e) {
                                  return Card(
                                    color: Colors.green[100],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child: ListTile(
                                      title: Text(e),
                                      trailing:
                                          const Icon(Icons.catching_pokemon),
                                      onTap: () {
                                        deletecard(context, widget.id, 'RR', e);
                                      },
                                    ),
                                  );
                                }).toList(),
                              ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
