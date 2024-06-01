import 'package:assignment/task_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class OrdinaryTitle1 extends StatefulWidget {
  const OrdinaryTitle1({super.key});

  @override
  State<OrdinaryTitle1> createState() => _OrdinaryTitle1State();
}

class _OrdinaryTitle1State extends State<OrdinaryTitle1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 110.0, // Adjust height as desired
            width: 110.0,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
              padding: const EdgeInsets.all(5),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    bottom: 10,
                    right: 0,
                    child: Text(
                      'Button 1   Name',
                      maxLines: 2,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Image(
                      image: AssetImage("assets/Images/setting.png"),
                      width: 50,
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        Spacer(),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 110.0,
            width: 110.0,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
              padding: const EdgeInsets.all(5),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    bottom: 10,
                    right: 0,
                    child: Text(
                      'Button 2   Name',
                      maxLines: 2,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Image(
                      image: AssetImage("assets/Images/setting.png"),
                      width: 50,
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 110.0,
            width: 110.0,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
              padding: const EdgeInsets.all(5),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    bottom: 10,
                    right: 0,
                    child: Text(
                      'Button 3   Name',
                      maxLines: 2,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Image(
                      image: AssetImage("assets/Images/setting.png"),
                      width: 50,
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}

