import 'package:flutter/material.dart';

class Policy extends StatefulWidget {
  const Policy({super.key});

  @override
  State<Policy> createState() => _PolicyState();
}

class _PolicyState extends State<Policy> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Center(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'This is a random photo note with nothing specific, but could contain details that end this page',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.0,color: Colors.grey),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  child: const Text(
                    'Privacy',
                    style: TextStyle(color: Colors.blue,
                      fontSize: 16.0,
                      decoration: TextDecoration.underline,decorationColor: Colors.blue),
                  ),
                  onTap: () {},

                ),
                InkWell(
                  child: const Text(
                    'Terms',
                    style: TextStyle(color: Colors.blue,
                        fontSize: 16.0,
                        decoration: TextDecoration.underline, decorationColor: Colors.blue),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    );
  }
}

