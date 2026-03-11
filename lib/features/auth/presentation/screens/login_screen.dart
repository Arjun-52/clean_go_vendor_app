import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  void validateAndContinue() {
    String phone = phoneController.text.trim();
    RegExp phoneRegex = RegExp(r'^[6-9]\d{9}$');

    if (phoneRegex.hasMatch(phone)) {
      context.push('/otp', extra: '+91 $phone');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter a valid 10-digit mobile number")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            const SizedBox(height: 100),

            /// Logo icon
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                color: const Color(0xFF0D3B66),
                borderRadius: BorderRadius.circular(14),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  'assets/images/cleango_logo.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            /// App Name
            const Text(
              "CleanGo",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D3B66),
              ),
            ),

            const Text(
              "Vendor",
              style: TextStyle(
                fontSize: 19,
                color: Color(0xFF0D3B66),
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 60),

            /// Title
            const Text(
              "Log in or Sign Up",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 25),

            /// Phone Input Box
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  const Text("🇮🇳 +91", style: TextStyle(fontSize: 16)),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_drop_down),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Mobile number",
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            /// Continue Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: validateAndContinue,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0D3B66),
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

            const Spacer(),

            /// Terms text
            const Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: Text(
                "By continuing, you agree to our Terms and Conditions\n& Privacy Policy",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
