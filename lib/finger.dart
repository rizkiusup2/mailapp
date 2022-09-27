import 'package:flutter/material.dart';

class Finger extends StatefulWidget {
  const Finger({super.key});

  @override
  State<Finger> createState() => _FingerState();
}

class _FingerState extends State<Finger> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 500,
      child: Image(image: AssetImage('assets/images/1.jpg')),
    );
  }
}
