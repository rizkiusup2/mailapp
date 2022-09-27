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
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Image(
        image: AssetImage('assets/images/1.jpg'),
        height: 500,
        width: 500,
      ),
    );
  }
}
