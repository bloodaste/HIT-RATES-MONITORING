import 'package:flutter/material.dart';

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
      child: Column(
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
            controller: widget.sr,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "AR hits",
            ),
            controller: widget.ar,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "RR hits",
            ),
            controller: widget.rr,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Remaining packs",
            ),
            controller: widget.remainingpacks,
          ),
        ],
      ),
    );
  }
}
