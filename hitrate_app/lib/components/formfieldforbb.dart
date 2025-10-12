import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Bbformfiel extends StatefulWidget {
  final TextEditingController setname;

  final TextEditingController totalpacks;

  const Bbformfiel(
      {super.key, required this.setname, required this.totalpacks});

  @override
  State<Bbformfiel> createState() => _FormfieldState();
}

class _FormfieldState extends State<Bbformfiel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Set name",
            ),
            controller: widget.setname,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Packs in the sets",
            ),
            controller: widget.totalpacks,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ],
      ),
    );
  }
}
