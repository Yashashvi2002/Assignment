import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class Openlist extends StatefulWidget {
  const Openlist({super.key});

  @override
  State<Openlist> createState() => _OpenlistState();
}

class _OpenlistState extends State<Openlist> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 30.0,
          width: 100.0,
          decoration: BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0, // Adjust for desired shadow spread
                blurRadius: 5.0, // Adjust for desired shadow blur
                offset: Offset(0, 3), // Adjust for shadow position
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(3.0),
            child: Column(
              children: [
                Center(child: Text("Open List"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}


