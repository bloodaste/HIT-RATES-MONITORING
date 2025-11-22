import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hitrate_app/components/formfield.dart';
import 'package:hitrate_app/model/quemodel.dart';
import 'package:hitrate_app/provider/que.dart';
import 'package:excel/excel.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';

class Que extends ConsumerStatefulWidget {
  const Que({super.key});

  @override
  ConsumerState<Que> createState() => _QueState();
}

class _QueState extends ConsumerState<Que> {
  String? filepath;
  final editor = Provider.autoDispose<TextEditingController>((ref) {
    final buyersname = TextEditingController();

    ref.onDispose(() {
      buyersname.dispose();
    });

    return buyersname;
  });
  final editor2 = Provider.autoDispose<TextEditingController>((ref) {
    final refnumber = TextEditingController();

    ref.onDispose(() {
      refnumber.dispose();
    });

    return refnumber;
  });
  void addque() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          final buyersname = ref.watch(editor);
          final refnumber = ref.watch(editor2);
          return AlertDialog(
            title: Text('Add to que'),
            content: Queform(
              firstfield: 'Name',
              seconfield: 'Ref',
              controller: buyersname,
              controller2: refnumber,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  ref.read(queProvider.notifier).add(Quemodel(
                      buyersname: buyersname.text, refid: refnumber.text));
                },
                child: Text('Add'),
              ),
            ],
          );
        });
  }

  void update(Quemodel que) {
    final buyersname = TextEditingController();
    final refnumber = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Update ${que.buyersname}'),
        content: Queform(
          firstfield: 'Buyers name',
          controller: buyersname,
          seconfield: 'Ref number',
          controller2: refnumber,
        ),
        actions: [
          TextButton(
            onPressed: () {
              final updated = que.copyWith(
                buyersname:
                    buyersname.text.isEmpty ? que.buyersname : buyersname.text,
                refid: refnumber.text.isEmpty ? que.refid : refnumber.text,
                id: que.id,
              );

              ref.read(queProvider.notifier).updateque(updated);
              Navigator.pop(context);
            },
            child: Text('Update'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }

  Future<void> importexcel() async {
    final queList = ref.read(queProvider);
    if (queList.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Que list is empty!")),
      );
      return;
    }

    if (filepath == null || filepath!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please pick a folder first")),
      );
      return;
    }

    var excel = Excel.createExcel();
    Sheet sheet = excel['Audit Excel'];

    sheet.cell(CellIndex.indexByString("A1")).value =
        TextCellValue('Buyers Name');
    sheet.cell(CellIndex.indexByString("B1")).value =
        TextCellValue('Ref Number');
    sheet.cell(CellIndex.indexByString("C1")).value =
        TextCellValue('Timestamp');

    for (int i = 0; i < queList.length; i++) {
      final q = queList[i];
      sheet.cell(CellIndex.indexByString("A${i + 2}")).value =
          TextCellValue(q.buyersname);
      sheet.cell(CellIndex.indexByString("B${i + 2}")).value =
          TextCellValue(q.refid);
      sheet.cell(CellIndex.indexByString("C${i + 2}")).value =
          TextCellValue(DateTime.now().toString());
    }

    final bytes = excel.save();
    final filename = "auditlist_${DateTime.now()}.xlsx";

    final file = File("$filepath/$filename");
    await file.writeAsBytes(bytes!);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Excel saved at: ${file.path}")),
    );
  }

  Future<void> filepaths() async {
    String? result = await FilePicker.platform.getDirectoryPath();

    if (result != null) {
      setState(() {
        filepath = result;
      });

      print(filepath);
    }
  }

  @override
  Widget build(BuildContext context) {
    final que = ref.watch(queProvider);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(''),
            SizedBox(
              height: 10,
            ),
            Text(
              'Rip & Ship Que',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'In Que',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Buyers Name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Ref Number',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            que.isEmpty
                ? Expanded(
                    child: Center(
                      child: Text(
                        'No que',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      itemCount: que.length,
                      itemBuilder: (BuildContext context, int index) {
                        final queing = que[index];
                        return GestureDetector(
                          onLongPress: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                        'Do you want to delete ${queing.buyersname}'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          ref
                                              .read(queProvider.notifier)
                                              .deleteinque(queing.id!);
                                        },
                                        child: Text('Delete'),
                                      )
                                    ],
                                  );
                                });
                          },
                          onDoubleTap: () {
                            update(queing);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 14,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      '${index + 1}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      queing.buyersname,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        queing.refid,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                addque();
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.white30,
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () async {
                await filepaths();
                if (filepath == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please pick a folder'),
                    ),
                  );
                } else {
                  importexcel();
                }
              },
              child: Icon(Icons.download),
              backgroundColor: Colors.white30,
            ),
          ],
        ),
      ),
    );
  }
}
