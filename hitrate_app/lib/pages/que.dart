import 'package:flutter/material.dart';

class Que extends StatefulWidget {
  const Que({super.key});

  @override
  State<Que> createState() => _QueState();
}

class _QueState extends State<Que> {
  @override
  Widget build(BuildContext context) {
    return Text('current q');
  }
}
