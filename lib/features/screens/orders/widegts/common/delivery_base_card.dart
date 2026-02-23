import 'package:flutter/material.dart';

class DeliveryBaseCard extends StatelessWidget {
  final Widget child;

  const DeliveryBaseCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
          ),
        ],
      ),
      child: child,
    );
  }
}