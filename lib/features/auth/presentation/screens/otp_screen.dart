import 'package:clean_go_vendor_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;

  const OtpScreen({super.key, required this.phoneNumber});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  Timer? timer;
  int secondsRemaining = 30;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    secondsRemaining = 30;

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining == 0) {
        timer.cancel();
      } else {
        setState(() {
          secondsRemaining--;
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void onOtpChange(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  bool isOtpValid() {
    for (var controller in controllers) {
      if (controller.text.isEmpty) {
        return false;
      }
    }
    return true;
  }

  Widget otpBox(int index) {
    return SizedBox(
      width: 60,
      height: 60,
      child: TextField(
        controller: controllers[index],
        focusNode: focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: "",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        style: const TextStyle(fontSize: 22),
        onChanged: (value) => onOtpChange(value, index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF0D3B66);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "OTP Verification",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 40),

            Text(
              "We have sent a verification code to",
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            Text(
              widget.phoneNumber,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),

            const SizedBox(height: 30),

            const Text(
              "Enter the Code",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [otpBox(0), otpBox(1), otpBox(2), otpBox(3)],
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (isOtpValid()) {
                    context.go('/home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please enter the 4-digit OTP"),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Didn't receive the OTP? "),

                secondsRemaining == 0
                    ? GestureDetector(
                        onTap: () {
                          startTimer();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("OTP Resent")),
                          );
                        },
                        child: const Text(
                          "Resend OTP",
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : Text(
                        "Resend in ${secondsRemaining}s",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
