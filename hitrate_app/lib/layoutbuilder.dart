import 'package:flutter/material.dart';

class Responsivelayout extends StatelessWidget {
  final Widget mobilebody;
  final Widget tabletbody;
  const Responsivelayout({
    super.key,
    required this.mobilebody,
    required this.tabletbody,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(builder: (
          BuildContext context,
          BoxConstraints constrain,
        ) {
          if (constrain.maxHeight > 600) {
            return mobilebody;
          } else {
            return tabletbody;
          }
        }),
      ),
    );
  }
}
