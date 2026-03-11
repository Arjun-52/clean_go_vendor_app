import 'package:flutter/material.dart';

class StepCircle extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;

  const StepCircle({
    super.key,
    required this.icon,
    required this.label,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    const activeColor = Color(0xff1C8D75);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: active ? activeColor : Colors.grey.shade300,
          child: Icon(
            icon,
            size: 20,
            color: active ? Colors.white : Colors.grey.shade700,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: active ? activeColor : Colors.grey,
          ),
        ),
      ],
    );
  }
}
