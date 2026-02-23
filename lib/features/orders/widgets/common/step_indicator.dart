import 'package:flutter/material.dart';
import 'step_circle.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep; // 0 = Pickup, 1 = Damage, 2 = Seal, 3 = OTP

  const StepIndicator({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    const activeColor = Color(0xff1C8D75);
    const inactiveColor = Color(0xffE0E0E0);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StepCircle(
            icon: Icons.camera_alt,
            label: "Photos",
            active: currentStep >= 0,
          ),

          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 24),
              height: 2,
              color: currentStep >= 1 ? activeColor : inactiveColor,
            ),
          ),

          StepCircle(
            icon: Icons.warning,
            label: "Damage",
            active: currentStep >= 1,
          ),

          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 24),
              height: 2,
              color: currentStep >= 2 ? activeColor : inactiveColor,
            ),
          ),

          StepCircle(
            icon: Icons.inventory,
            label: "Seal",
            active: currentStep >= 2,
          ),

          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 24),
              height: 2,
              color: currentStep >= 3 ? activeColor : inactiveColor,
            ),
          ),

          StepCircle(icon: Icons.lock, label: "OTP", active: currentStep >= 3),
        ],
      ),
    );
  }
}
