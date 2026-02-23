import 'package:flutter/material.dart';
import 'package:clean_go_vendor_app/core/widgets/app_bottom_nav.dart';
import 'package:clean_go_vendor_app/features/screens/orders/widegts/delivery/delivery_app_bar.dart';
import 'package:clean_go_vendor_app/features/screens/orders/widegts/common/delivery_base_card.dart';
import 'package:clean_go_vendor_app/features/screens/orders/widegts/delivery/qr_info_section.dart';
import 'package:clean_go_vendor_app/features/screens/orders/widegts/delivery/qr_verified_section.dart';
import 'delivery_checklist_screen.dart';

class DeliveryQrVerifiedScreen extends StatelessWidget {
  DeliveryQrVerifiedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF0D3B66);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: DeliveryAppBar(
        orderId: "ORD-2026-001",
        customerName: "Aday Sharma",
        timer: "00:57:02",
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: DeliveryBaseCard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              QrInfoSection(orderId: "ORD-2026-001"),
              QrVerifiedSection(),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const DeliveryChecklistScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Proceed to Checklist",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: const AppBottomNav(currentIndex: 2),
    );
  }
}
