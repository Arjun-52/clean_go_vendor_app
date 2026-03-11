import 'package:flutter/material.dart';
import 'step_circle.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep;

  const StepIndicator({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    const activeColor = Color(0xFF148C81);
    const inactiveColor = Color(0xffE0E0E0);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStep(Icons.camera_alt, "Photos", 0),
          _buildLine(currentStep >= 1, activeColor, inactiveColor),

          _buildStep(Icons.warning, "Damage", 1),
          _buildLine(currentStep >= 2, activeColor, inactiveColor),

          _buildStep(Icons.inventory, "Seal", 2),
          _buildLine(currentStep >= 3, activeColor, inactiveColor),

          _buildStep(Icons.lock, "OTP", 3),
        ],
      ),
    );
  }

  Widget _buildStep(IconData icon, String label, int stepIndex) {
    return StepCircle(
      icon: icon,
      label: label,
      active: currentStep >= stepIndex,
    );
  }

  Widget _buildLine(bool active, Color activeColor, Color inactiveColor) {
    return Expanded(
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: const EdgeInsets.only(top: 24),
          height: 2,
          color: active ? activeColor : inactiveColor,
        ),
      ),
    );
  }
}
