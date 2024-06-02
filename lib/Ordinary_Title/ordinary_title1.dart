import 'package:flutter/material.dart';

import '../Themes/constants.dart';

class OrdinaryTitle1 extends StatefulWidget {
  const OrdinaryTitle1({super.key});

  @override
  State<OrdinaryTitle1> createState() => _OrdinaryTitle1State();
}

class _OrdinaryTitle1State extends State<OrdinaryTitle1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          children: const [
            DialogueBox(button: Button_1(), title: 'Button 1   Name', image: 'assets/Images/setting.png',),
            // const Spacer(),
            SizedBox(width: 20,),
            DialogueBox(button: Button_2(), title: 'Button 2   Name', image: 'assets/Images/setting.png',),
            SizedBox(width: 20,),
            DialogueBox(button: Button_3(), title: 'Button 3   Name', image: 'assets/Images/setting.png',),

          ],
        ),
      ),
    ));
  }
}

// Design for the CTAs DialogueBox
class DialogueBox extends StatefulWidget {
  const DialogueBox({super.key,
    required this.button,
    required this.title,
    required this.image});
  final Widget button;
  final String title, image;

  @override
  State<DialogueBox> createState() => _DialogueBoxState();
}

class _DialogueBoxState extends State<DialogueBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.button),
        );
      },
      child: Container(
        height: 100.0,
        width: 100.0,
        decoration: BoxDecoration(
          color: k1PrimaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          boxShadow:kShadow,
        ),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                bottom: 10,
                right: 0,
                child: Text(
                  widget.title,
                  maxLines: 2,
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Image(
                  image: AssetImage(widget.image),
                  width: 50,
                  height: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




//  Made this Temporary Pages Button1, Button2 and Button3
//  Can be edited depending on the design and  can be moved to other place in future..
class Button_1 extends StatefulWidget {
  const Button_1({super.key});

  @override
  State<Button_1> createState() => _Button_1State();
}

class _Button_1State extends State<Button_1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(130),
              child: Text("Schedule 1",textAlign: TextAlign.center,style: TextStyle(fontSize: 24),),
            )
          ],
        )
      ),
    );
  }
}

class Button_2 extends StatefulWidget {
  const Button_2({super.key});

  @override
  State<Button_2> createState() => _Button_2State();
}

class _Button_2State extends State<Button_2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(130),
                child: Text("Schedule 2",textAlign: TextAlign.center,style: TextStyle(fontSize: 24),),
              )
            ],
          )
      ),
    );
  }
}

class Button_3 extends StatefulWidget {
  const Button_3({super.key});

  @override
  State<Button_3> createState() => _Button_3State();
}

class _Button_3State extends State<Button_3> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
          body: Column(
           children: [
          Padding(
          padding: EdgeInsets.all(130),
        child: Text("Schedule 3",textAlign: TextAlign.center,style: TextStyle(fontSize: 24),),
      )
      ],
          )
      ),
    );
  }
}
