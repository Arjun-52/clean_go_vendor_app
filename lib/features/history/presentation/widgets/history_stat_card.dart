import 'package:flutter/material.dart';
import 'package:clean_go_vendor_app/core/constants/app_colors.dart';

class HistoryStatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const HistoryStatCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(height: 10),

          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 6),

          Text(label, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
