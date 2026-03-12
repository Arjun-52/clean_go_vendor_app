import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:clean_go_vendor_app/core/widgets/app_bottom_nav.dart';

import '../widgets/history_stat_card.dart';
import '../widgets/history_card.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      /// ===== APP BAR =====
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            context.go('/home');
          },
        ),
        title: const Text(
          "History",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      /// ===== BODY =====
      body: Column(
        children: [
          const SizedBox(height: 16),

          /// ===== STATS SECTION =====
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                HistoryStatCard(
                  icon: Icons.inventory_2,
                  value: "265",
                  label: "Total",
                ),
                HistoryStatCard(
                  icon: Icons.trending_up,
                  value: "96.5%",
                  label: "SLA Rate",
                ),
                HistoryStatCard(
                  icon: Icons.warning_amber_rounded,
                  value: "3.5%",
                  label: "Breach",
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          /// ===== HISTORY LIST =====
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: const [
                HistoryCard(
                  orderId: "ORD-2026-0012",
                  customerName: "Sameer Vyas",
                  items: "6 items",
                  serviceType: "dry-clean",
                  price: "₹850",
                ),

                HistoryCard(
                  orderId: "ORD-2026-0013",
                  customerName: "Aday Sharma",
                  items: "12 items",
                  serviceType: "wash-fold",
                  price: "₹1268",
                ),
              ],
            ),
          ),
        ],
      ),

      /// ===== BOTTOM NAV =====
      bottomNavigationBar: const AppBottomNav(currentIndex: 3),
    );
  }
}
