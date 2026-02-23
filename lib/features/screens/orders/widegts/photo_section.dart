import 'package:flutter/material.dart';

class PhotoSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;
  final String footerText;

  const PhotoSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
    required this.footerText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(subtitle, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 15),
          child,
          const SizedBox(height: 10),
          Text(footerText, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
