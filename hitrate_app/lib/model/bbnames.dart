import 'package:flutter/widgets.dart';

class Bbnamesmodel {
  final String setname;
  final Nameclass? names;
  final String totalpacks;
  final String timestamp;

  Bbnamesmodel({
    this.names,
    required this.totalpacks,
    required this.setname,
    required this.timestamp,
  });
}

class Nameclass {
  int index;
  String buyername;

  Nameclass({
    required this.index,
    required this.buyername,
  });
}
