import 'package:flutter/material.dart';
import 'package:clean_go_vendor_app/features/orders/presentation/widgets/common/step_indicator.dart';
import 'package:clean_go_vendor_app/features/auth/presentation/widgets/otp_input_row.dart';
import 'package:clean_go_vendor_app/core/widgets/app_bottom_nav.dart';
import 'package:clean_go_vendor_app/features/orders/presentation/screens/otp_verified_screen.dart';
import 'package:clean_go_vendor_app/core/constants/app_colors.dart';

class PickupOtpScreen extends StatefulWidget {
  const PickupOtpScreen({super.key});

  @override
  State<PickupOtpScreen> createState() => _PickupOtpScreenState();
}

class _PickupOtpScreenState extends State<PickupOtpScreen> {
  final List<TextEditingController> controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  void onOtpChange(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    color:
    AppColors.primary;

    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),

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

      body: Column(
        children: [
          const SizedBox(height: 10),

          StepIndicator(currentStep: 3),

          const SizedBox(height: 16),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 3),
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

                      const SizedBox(height: 16),

                      const Text(
                        "Pickup OTP Verification",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        "Enter the 4-digit OTP shared by the customer to complete pickup.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),

                      const SizedBox(height: 20),

                      OtpInputRow(
                        controllers: controllers,
                        focusNodes: focusNodes,
                        onChanged: onOtpChange,
                      ),

                      const SizedBox(height: 24),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          onPressed: () {
                            String otp = controllers.map((c) => c.text).join();

                            if (otp.length == 4) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const OtpVerifiedScreen(),
                                ),
                              ).then((value) {
                                if (value == true) {
                                  Navigator.pop(context, true);
                                }
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Please enter complete 4-digit OTP",
                                  ),
                                ),
                              );
                            }
                          },
                          child: const Text(
                            "Verify OTP",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      const Text(
                        "⚠ No OTP = No Pickup Completion",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: const AppBottomNav(currentIndex: 0),
    );
  }
}
