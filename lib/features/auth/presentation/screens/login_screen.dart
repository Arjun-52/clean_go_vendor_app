import 'package:flutter/material.dart';
import 'package:clean_go_vendor_app/features/auth/presentation/screens/otp_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: const Color(0xFF0D3B66),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(Icons.verified, color: Colors.white, size: 40),
            ),

            const SizedBox(height: 15),

            /// App Name
            const Text(
              "CleanGo",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D3B66),
              ),
            ),

            const Text(
              "Vendor",
              style: TextStyle(fontSize: 16, color: Color(0xFF0D3B66)),
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
                      keyboardType: TextInputType.phone,
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          const OtpScreen(phoneNumber: "+91 9347830977"),
                    ),
                  );
                },
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
