import 'package:flutter/material.dart';

class OrdinaryTitle2 extends StatefulWidget {
  const OrdinaryTitle2({super.key});

  @override
  State<OrdinaryTitle2> createState() => _OrdinaryTitle2State();
}

class _OrdinaryTitle2State extends State<OrdinaryTitle2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 80.0,
          width: 360.0,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0), // This makes the corners rounded
          ),
          child: const Text(
            'This is a state box with a message, showing that the section is empty right now',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12.0,
            ),
          ),
        )

      ],
    ));
  }
}

