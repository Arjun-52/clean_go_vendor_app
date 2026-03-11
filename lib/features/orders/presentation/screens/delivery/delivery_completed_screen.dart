import 'package:flutter/material.dart';
import 'package:clean_go_vendor_app/core/widgets/app_bottom_nav.dart';
import 'package:clean_go_vendor_app/features/home/presentation/screens/home_screen.dart';
import 'package:clean_go_vendor_app/core/constants/app_colors.dart';

class DeliveryCompletedScreen extends StatelessWidget {
  const DeliveryCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const successGreen = Color(0xFF23B26D);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Delivery • ORD-2026-001",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2),
            Text(
              "Aday Sharma",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFE6F4EA),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.green, width: 1.5),
            ),
            child: const Text(
              "00:57:02",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 15,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// SUCCESS CIRCLE
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: successGreen.withOpacity(0.15),
                    ),
                    child: const Center(
                      child: CircleAvatar(
                        radius: 45,
                        backgroundColor: successGreen,
                        child: Icon(Icons.check, size: 40, color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Delivered!",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: successGreen,
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    "ORD-2026-001",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => const HomeScreen()),
                          (route) => false,
                        );
                      },
                      child: const Text(
                        "Back to Dashboard",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      bottomNavigationBar: AppBottomNav(currentIndex: 2),
    );
  }
}
