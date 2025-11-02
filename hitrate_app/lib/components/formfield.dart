import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Queform extends StatefulWidget {
  final String firstfield;
  final String? seconfield;
  final TextEditingController controller;
  final TextEditingController? controller2;
  const Queform({
    super.key,
    required this.firstfield,
    required this.controller,
    this.controller2,
    this.seconfield,
  });

  @override
  State<Queform> createState() => _FormfieldState();
}

class _FormfieldState extends State<Queform> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: widget.firstfield,
            ),
            controller: widget.controller,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: widget.seconfield,
            ),
            controller: widget.controller2,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
