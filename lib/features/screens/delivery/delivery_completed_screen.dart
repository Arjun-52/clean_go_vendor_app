import 'package:flutter/material.dart';
import 'package:clean_go_vendor_app/core/widgets/app_bottom_nav.dart';
import 'package:clean_go_vendor_app/features/screens/home/screens/home_screen.dart';

class DeliveryCompletedScreen extends StatelessWidget {
  const DeliveryCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF0D3B66);
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
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
          ],
        ),
        actions: [
  Container(
    margin: const EdgeInsets.only(right: 16),
    padding: const EdgeInsets.symmetric(
        horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: const Color(0xFFE6F4EA),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: Colors.green,
        width: 1.5,
      ),
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

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 12,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              /// SUCCESS CIRCLE
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: successGreen.withOpacity(0.2),
                ),
                child: const Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: successGreen,
                    child: Icon(
                      Icons.check,
                      size: 45,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Delivered!",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: successGreen,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "ORD-2026-001",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 30),

              /// BACK BUTTON
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const HomeScreen()),
                      (route) => false,
                    );
                  },
                  child: const Text(
                    "Back to Dashboard",
                    style: TextStyle(
                        color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: AppBottomNav(currentIndex: 2),
    );
  }
}