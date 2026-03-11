import 'package:flutter/material.dart';
import 'package:clean_go_vendor_app/features/home/presentation/screens/home_screen.dart';

class DeliveryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String orderId;
  final String customerName;
  final String timer;

  const DeliveryAppBar({
    super.key,
    required this.orderId,
    required this.customerName,
    required this.timer,
  });

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
            (route) => false,
          );
        },
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Delivery • $orderId",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            customerName,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 13,
            ),
          ),
        ],
      ),
      actions: [
        DeliveryTimerBadge(timer: timer),
      ],
    );
  }
}

class DeliveryTimerBadge extends StatelessWidget {
  final String timer;

  const DeliveryTimerBadge({super.key, required this.timer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFE6F4EA),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.green,
          width: 1.5,
        ),
      ),
      child: Text(
        timer,
        style: const TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}