import 'package:flutter/material.dart';

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
        leading: const BackButton(color: Colors.black),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Pickup • ORD-2026-001",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 2),
            Text(
              "Marco Jess",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16, top: 10, bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: green),
            ),
            child: const Center(
              child: Text(
                "01:57:22",
                style: TextStyle(
                  color: green,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    )
                  ],
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.lock_outline,
                      size: 60,
                      color: primaryBlue,
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
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
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
                            color: green,
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
                        color: green,
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
                          backgroundColor: primaryBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
  Navigator.pop(context, true);
},
                        child: const Text(
                          "Complete Pickup",
                          style: TextStyle(
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
        selectedItemColor: primaryBlue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.inventory_2_outlined), label: "Processing"),
          BottomNavigationBarItem(icon: Icon(Icons.local_shipping_outlined), label: "Delivery"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
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
            color: green,
          ),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: green,
            fontWeight: FontWeight.w600,
          ),
        )
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
        height: 2,
        color: const Color(0xFF1E8E3E),
      ),
    );
  }
}