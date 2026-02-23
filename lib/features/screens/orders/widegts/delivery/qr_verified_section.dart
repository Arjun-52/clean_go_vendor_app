import 'package:flutter/material.dart';

class QrVerifiedSection extends StatelessWidget {
  const QrVerifiedSection({super.key});

  @override
  Widget build(BuildContext context) {
    const successGreen = Color(0xFF23B26D);

    return Column(
      children: [
        const SizedBox(height: 30),
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: successGreen.withOpacity(0.2),
          ),
          child: const Center(
            child: CircleAvatar(
              radius: 45,
              backgroundColor: successGreen,
              child: Icon(Icons.check, color: Colors.white, size: 40),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "QR Verified!",
          style: TextStyle(
            color: successGreen,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}