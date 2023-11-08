import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, this.onTap, required this.text});
  VoidCallback? onTap;
  String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
          minimumSize: const Size.fromHeight(60),
          backgroundColor: Colors.white),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
