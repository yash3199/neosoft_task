import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  const CommonButton({required this.onTap, required this.text,super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:
      Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.blue[900],
        ),
        child: Center(
            child: Text(text, style: TextStyle(color: Colors.white,
                fontSize: 20, fontWeight: FontWeight.bold),)),
      ),

    );
  }
}
