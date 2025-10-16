import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Formfield extends StatefulWidget {
  final TextEditingController setname;
  final TextEditingController ar;
  final TextEditingController sr;
  final TextEditingController rr;
  final TextEditingController remainingpacks;
  const Formfield({
    super.key,
    required this.setname,
    required this.ar,
    required this.sr,
    required this.rr,
    required this.remainingpacks,
  });

  @override
  State<Formfield> createState() => _FormfieldState();
}

class _FormfieldState extends State<Formfield> {
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
              labelText: "Sr hits",
            ),
            maxLength: 1,
            controller: widget.sr,
            inputFormatters: [
              FilteringTextInputFormatter.allow('1'),
            ],
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "AR hits",
            ),
            controller: widget.ar,
            maxLength: 1,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[12345]')),
            ],
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "RR hits",
            ),
            maxLength: 1,
            controller: widget.rr,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Remaining packs",
            ),
            controller: widget.remainingpacks,
            maxLength: 2,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ],
      ),
    );
  }
}
