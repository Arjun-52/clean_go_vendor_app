import 'package:flutter/material.dart';

class SuccessCircle extends StatelessWidget {
  final double size;

  const SuccessCircle({super.key, this.size = 120});

  @override
  Widget build(BuildContext context) {
    const successGreen = Color(0xFF23B26D);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: successGreen.withOpacity(0.2),
      ),
      child: const Center(
        child: CircleAvatar(
          radius: 45,
          backgroundColor: successGreen,
          child: Icon(Icons.check, size: 40, color: Colors.white),
        ),
      ),
    );
  }
}
