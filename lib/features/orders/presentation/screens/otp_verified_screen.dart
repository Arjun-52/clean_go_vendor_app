import 'package:clean_go_vendor_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:clean_go_vendor_app/features/home/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

class OtpVerifiedScreen extends StatelessWidget {
  const OtpVerifiedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF0D3B66);
    const green = Color(0xFF1E8E3E);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      /// ===== APP BAR =====
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pickup • ORD-2026-001",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            Text(
              "Marco Jess",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ],
        ),

        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0x14008847),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFF008847)),
            ),
            child: const Text(
              "01:58:32",
              style: TextStyle(
                color: Color(0xFF008847),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),

      /// ===== BODY =====
      body: Column(
        children: [
          const SizedBox(height: 20),

          /// ===== STEP INDICATOR =====
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _StepItem(icon: Icons.camera_alt_outlined, label: "Photos"),

                _Line(),

                _StepItem(icon: Icons.report_problem_outlined, label: "Damage"),

                _Line(),

                _StepItem(icon: Icons.inventory_2_outlined, label: "Seal"),

                _Line(),

                _StepItem(icon: Icons.lock_outline, label: "OTP"),
              ],
            ),
          ),

          const SizedBox(height: 30),

          /// ===== OTP VERIFIED CARD =====
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 15,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.lock_outline,
                      size: 60,
                      color: AppColors.primary,
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Pickup OTP Verification",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      "Enter the 4-digit OTP shared by the customer to complete pickup.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),

                    const SizedBox(height: 30),

                    /// Green Check Circle
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: green.withOpacity(0.15),
                      ),
                      child: Center(
                        child: Container(
                          height: 90,
                          width: 90,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF1AB96F),
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "OTP Verified!",
                      style: TextStyle(
                        color: Color(0xFF1AB96F),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Spacer(),

                    /// Complete Pickup Button
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19),
                          ),
                        ),
                        onPressed: () {
                          context.go('/home', extra: true);
                        },
                        child: const Text(
                          "Complete Pickup",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    const Text(
                      "⚠ No OTP = No Pickup Completion",
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
        ],
      ),

      /// ===== BOTTOM NAV =====
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2_outlined),
            label: "Processing",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping_outlined),
            label: "Delivery",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

/// Step Item Widget
class _StepItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _StepItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF1E8E3E);

    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF1E8E3E),
          ),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF1E8E3E),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

/// Connecting Line
class _Line extends StatelessWidget {
  const _Line();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 30), // aligns to circle center
        height: 2,
        color: const Color(0xFF1E8E3E),
      ),
    );
  }
}
