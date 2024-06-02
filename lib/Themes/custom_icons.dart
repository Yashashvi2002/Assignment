import 'package:flutter/material.dart';

import 'constants.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const CustomIconButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(width: 40,  // Adjust the width to reduce the circle radius
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kPrimaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius:10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: IconButton(
          icon: Icon(icon),
          color: Colors.black,
          iconSize: 25,
          onPressed: onPressed,
        ),
      ),
    );
  }
}