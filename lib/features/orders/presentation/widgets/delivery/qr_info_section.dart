import 'package:flutter/material.dart';
import 'package:clean_go_vendor_app/core/constants/app_colors.dart';

class QrInfoSection extends StatelessWidget {
  final String orderId;

  const QrInfoSection({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    color:
    AppColors.primary;

    return Column(
      children: [
        const Icon(Icons.qr_code_scanner, size: 80, color: AppColors.primary),
        const SizedBox(height: 20),
        const Text(
          "Scan Order QR Code",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
          style: TextStyle(color: Colors.grey, fontSize: 13),
        ),
      ],
    );
  }
}
