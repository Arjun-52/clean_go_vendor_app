import 'package:flutter/material.dart';

import 'package:clean_go_vendor_app/core/widgets/app_bottom_nav.dart';

import 'package:clean_go_vendor_app/features/orders/presentation/widgets/delivery/delivery_app_bar.dart';
import 'package:clean_go_vendor_app/features/orders/presentation/widgets/common/delivery_base_card.dart';
import 'package:clean_go_vendor_app/features/orders/presentation/widgets/delivery/success_circle.dart';
import 'package:clean_go_vendor_app/core/widgets/custom_button.dart';
import 'package:clean_go_vendor_app/core/constants/app_colors.dart';
import 'delivery_completed_screen.dart';

class DeliveryOtpVerifiedScreen extends StatelessWidget {
  const DeliveryOtpVerifiedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    color:
    AppColors.primary;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: DeliveryAppBar(
        orderId: "ORD-2026-001",
        customerName: "Aday Sharma",
        timer: "00:57:02",
      ),
      body: Align(
        alignment: const Alignment(0, -0.75),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: DeliveryBaseCard(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.password, size: 80, color: AppColors.primary),
                const SizedBox(height: 20),

                const Text(
                  "Delivery OTP Verification",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Enter the customer's 4-digit delivery OTP.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 30),

                SuccessCircle(size: 130),

                const SizedBox(height: 20),

                const Text(
                  "OTP Verified!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF23B26D),
                  ),
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0D3B66),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DeliveryCompletedScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Complete Delivery",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  "⚠️ No OTP = No Delivery Completion",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 2),
    );
  }
}
