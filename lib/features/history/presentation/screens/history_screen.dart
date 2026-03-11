import 'package:flutter/material.dart';
import 'package:clean_go_vendor_app/core/constants/app_colors.dart';
import 'package:clean_go_vendor_app/core/widgets/app_bottom_nav.dart';
import 'package:clean_go_vendor_app/features/home/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

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
                _StatCard(
                  icon: Icons.inventory_2,
                  value: "265",
                  label: "Total",
                ),
                _StatCard(
                  icon: Icons.trending_up,
                  value: "96.5%",
                  label: "SLA Rate",
                ),
                _StatCard(
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
              children: [
                _HistoryCard(
                  orderId: "ORD-2026-0012",
                  customerName: "Sameer Vyas",
                  items: "6 items",
                  serviceType: "dry-clean",
                  price: "₹850",
                ),
                const SizedBox(height: 16),
                _HistoryCard(
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

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

class _HistoryCard extends StatelessWidget {
  final String orderId;
  final String customerName;
  final String items;
  final String serviceType;
  final String price;

  const _HistoryCard({
    required this.orderId,
    required this.customerName,
    required this.items,
    required this.serviceType,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 TOP ROW
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// 📦 Icon + Order ID
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.inventory_2,
                      color: AppColors.primary,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    orderId,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),

              /// 🟢 On Time Badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.green, width: 1.2),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.check_circle, color: Colors.green, size: 16),
                    SizedBox(width: 6),
                    Text(
                      "On Time",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          /// Customer + Items
          Text(
            "$customerName • $items",
            style: const TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 12),

          /// 🔹 Service + Price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                serviceType,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                price,
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 8),

          const Text(
            "Evidence: 2 photos • QC ✓",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
