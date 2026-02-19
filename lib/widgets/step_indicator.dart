import 'package:flutter/material.dart';
import 'step_circle.dart';

class StepIndicator extends StatelessWidget {
  const StepIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    const activeColor = Color(0xff1C8D75);

    return Row(
      children: [
        const StepCircle(icon: Icons.camera_alt, label: "Photos", active: true),
        Expanded(child: Container(height: 2, color: activeColor)),
        const StepCircle(icon: Icons.warning, label: "Damage", active: true),
        Expanded(child: Container(height: 2, color: activeColor)),
        const StepCircle(icon: Icons.inventory, label: "Seal"),
        Expanded(child: Container(height: 2, color: activeColor)),
        const StepCircle(icon: Icons.lock, label: "OTP"),
      ],
    );
  }
}
