import 'package:flutter/material.dart';
import 'Themes/constants.dart';

class Openlist extends StatefulWidget {
  const Openlist({super.key});

  @override
  State<Openlist> createState() => _OpenlistState();
}

class _OpenlistState extends State<Openlist> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 30.0,
              width: 200.0,
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                boxShadow: kShadow,
              ),
              child: const Padding(
                padding: EdgeInsets.all(3.0),
                child: Column(
                  children: [
                    Center(child: Text("Open List"))
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 25,),
        Container(
          height: 1.0,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1.5,
                blurRadius: 5.0,
                offset: const Offset(3, 3),
              ),
              BoxShadow(
                color: Colors.white,
                spreadRadius: 3.0,
                blurRadius: 5.0,
                offset: const Offset(-3, -3),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
