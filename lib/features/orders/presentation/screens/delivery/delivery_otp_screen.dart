import 'package:flutter/material.dart';
import 'package:clean_go_vendor_app/core/widgets/app_bottom_nav.dart';
import 'package:clean_go_vendor_app/features/orders/presentation/screens/delivery/delivery_otp_verification_screen.dart';
import 'package:clean_go_vendor_app/core/constants/app_colors.dart';

class DeliveryOtpScreen extends StatefulWidget {
  const DeliveryOtpScreen({super.key});

  @override
  State<DeliveryOtpScreen> createState() => _DeliveryOtpScreenState();
}

class _DeliveryOtpScreenState extends State<DeliveryOtpScreen> {
  bool shirtChecked = true;
  bool trousersChecked = true;

  @override
  Widget build(BuildContext context) {
    color:
    AppColors.primary;

    int checkedCount = (shirtChecked ? 1 : 0) + (trousersChecked ? 1 : 0);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

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

      /// ===== BODY =====
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// -------- CHECKLIST CARD --------
            Container(
              padding: const EdgeInsets.all(20),
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
                children: [
                  /// Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.inventory_2, color: AppColors.primary),
                          SizedBox(width: 10),
                          Text(
                            "Item Checklist",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "$checkedCount/2",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// Shirt
                  _circleTile(
                    title: "Shirt",
                    qty: "x4",
                    value: shirtChecked,
                    onTap: () {
                      setState(() {
                        shirtChecked = !shirtChecked;
                      });
                    },
                  ),

                  const SizedBox(height: 12),

                  /// Trousers
                  _circleTile(
                    title: "Trousers",
                    qty: "x2",
                    value: trousersChecked,
                    onTap: () {
                      setState(() {
                        trousersChecked = !trousersChecked;
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 60),

            //PROCEED BUTTON
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: checkedCount == 2
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const DeliveryOtpVerificationScreen(),
                          ),
                        );
                      }
                    : null,

                child: const Text(
                  "Proceed to OTP",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: AppBottomNav(currentIndex: 2),
    );
  }

  /// -------- CUSTOM CIRCLE TILE --------
  Widget _circleTile({
    required String title,
    required String qty,
    required bool value,
    required VoidCallback onTap,
  }) {
    color:
    AppColors.primary;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: onTap,
              child: Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: value ? AppColors.primary : Colors.grey,
                    width: 2,
                  ),
                ),
                child: value
                    ? Center(
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary,
                          ),
                        ),
                      )
                    : null,
              ),
            ),
            const SizedBox(width: 12),
            Text(title, style: const TextStyle(fontSize: 16)),
          ],
        ),
        Text(qty, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }
}
