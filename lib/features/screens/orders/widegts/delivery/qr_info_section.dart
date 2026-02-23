import 'package:flutter/material.dart';

class QrInfoSection extends StatelessWidget {
  final String orderId;

  const QrInfoSection({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF0D3B66);

    return Column(
      children: [
        const Icon(Icons.qr_code_scanner, size: 80, color: primary),
        const SizedBox(height: 20),
        const Text(
          "Scan Order QR Code",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "QR: $orderId",
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Scan the QR code on the packet to verify the order before delivery.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}