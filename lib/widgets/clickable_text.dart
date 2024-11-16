import 'package:flutter/material.dart';

class ClickableText extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final TextStyle? style;

  const ClickableText({super.key,
    required this.text,
    required this.onTap,
    this.style  
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: style ?? 
          const TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
          ),
      ),
    );
  }
}