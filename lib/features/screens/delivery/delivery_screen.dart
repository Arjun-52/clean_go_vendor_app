import 'package:flutter/material.dart';
import 'package:clean_go_vendor_app/core/widgets/app_bottom_nav.dart';
import 'package:clean_go_vendor_app/features/screens/orders/widegts/delivery/delivery_app_bar.dart';
import 'package:clean_go_vendor_app/features/screens/orders/widegts/delivery/delivery_qr_card.dart';

class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: const DeliveryAppBar(
        orderId: "ORD-2026-001",
        customerName: "Aday Sharma",
        timer: "00:57:02",
      ),

      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: DeliveryQrCard(orderId: "ORD-2026-001"),
      ),

      bottomNavigationBar: const AppBottomNav(currentIndex: 2),
    );
  }
}