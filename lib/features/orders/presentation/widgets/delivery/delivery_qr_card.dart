import 'package:flutter/material.dart';
import 'package:clean_go_vendor_app/features/orders/presentation/screens/delivery/delivery_qr_verified_screen.dart';
import 'package:clean_go_vendor_app/core/constants/app_colors.dart';
import 'package:go_router/go_router.dart';

class DeliveryQrCard extends StatelessWidget {
  final String orderId;

  const DeliveryQrCard({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    color:
    AppColors.primary;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 15),
        ],
      ),
      child: Column(
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
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Scan the QR code on the packet to verify the order before delivery.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                context.push('/delivery-qr-verified');
              },
              icon: const Icon(Icons.qr_code, color: Colors.white),
              label: const Text(
                "Scan QR Code",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
