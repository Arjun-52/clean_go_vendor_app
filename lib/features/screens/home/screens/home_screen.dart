import 'package:flutter/material.dart';
import 'package:clean_go_vendor_app/features/screens/orders/screens/pickup_screen.dart';
import 'package:clean_go_vendor_app/features/screens/orders/screens/seal_screen.dart';
import 'package:clean_go_vendor_app/features/screens/orders/widegts/filter_chip_widget.dart';
import 'package:clean_go_vendor_app/features/screens/orders/widegts/order_card.dart';
import 'package:clean_go_vendor_app/features/screens/orders/widegts/stat_card.dart';
import 'package:clean_go_vendor_app/core/widgets/app_bottom_nav.dart';
import 'package:clean_go_vendor_app/models/order_model.dart';
import 'package:clean_go_vendor_app/features/screens/processing_screen/processign_screen.dart';
import 'package:clean_go_vendor_app/features/screens/notifications/screens/notifications_screen.dart';
import 'package:clean_go_vendor_app/features/screens/delivery/delivery_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _currentIndex = 0;
  void _showSuccessBanner() {
    final overlay = Overlay.of(context);

    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 60,
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 15),
              ],
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pickup Completed",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Order ORD-2026-001 picked up successfully",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => overlayEntry.remove(),
                  child: const CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.red,
                    child: Icon(Icons.close, size: 14, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(const Duration(seconds: 3), () {
      if (overlayEntry.mounted) {
        overlayEntry.remove();
      }
    });
  }

  String selectedFilter = "All";

  final List<OrderModel> orders = [
    OrderModel(
      orderId: "ORD-2026-001",
      status: "Pickup Required",
      price: "₹486",
      items: "3 items • wash-iron",
      tags: ["BREACHED", "FAST"],
      timer: null,
      isBreached: true,
    ),
    OrderModel(
      orderId: "ORD-2026-002",
      status: "Processing",
      price: "₹800",
      items: "6 items • wash-iron",
      tags: ["STANDARD"],
      timer: "05:22:30",
      isBreached: false,
    ),
    OrderModel(
      orderId: "ORD-2026-003",
      status: "Ready for Delivery",
      price: "₹486",
      items: "3 items • wash-iron",
      tags: ["BREACHED", "FAST"],
      timer: null,
      isBreached: true,
    ),
  ];

  List<OrderModel> get filteredOrders {
    if (selectedFilter == "All") return orders;

    if (selectedFilter == "Pickup") {
      return orders
          .where((order) => order.status == "Pickup Required")
          .toList();
    }

    if (selectedFilter == "Processing") {
      return orders.where((order) => order.status == "Processing").toList();
    }

    if (selectedFilter == "Delivery") {
      return orders
          .where((order) => order.status == "Ready for Delivery")
          .toList();
    }

    return orders;
  }

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF0D3B66);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          /// ===== HEADER =====
          Container(
            padding: const EdgeInsets.fromLTRB(16, 50, 16, 0),
            decoration: const BoxDecoration(color: primary),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Good Morning",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    Stack(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.notifications,
                            color: Colors.white,
                            size: 22,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const NotificationsScreen(),
                              ),
                            );
                          },
                        ),

                        Positioned(
                          right: 6,
                          top: 6,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  "Kevin John!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                /// Stats cards
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StatCard(title: "Active", count: "3"),
                    StatCard(title: "At Risk", count: "3"),
                    StatCard(title: "Completed", count: "3"),
                  ],
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),

          /// Overlapping Filter Section
          Transform.translate(
            offset: const Offset(0, -20),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ["All", "Pickup", "Processing", "Delivery"]
                    .map(
                      (filter) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: FilterChipWidget(
                            text: filter,
                            selected: selectedFilter == filter,
                            onTap: () {
                              setState(() {
                                selectedFilter = filter;
                              });
                            },
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),

          const SizedBox(height: 16),

          /// ===== ORDERS LIST =====
          ///
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredOrders.length,
              itemBuilder: (context, index) {
                final order = filteredOrders[index];

                return OrderCard(
                  orderId: order.orderId,
                  location: "Madhapur, Hyderabad, 50003",
                  items: order.items,
                  status: order.status,
                  price: order.price,
                  tags: order.tags,
                  timer: order.timer,
                  isBreached: order.isBreached,

                  buttonText: order.status == "Pickup Required"
                      ? "Start Pickup"
                      : order.status == "Processing"
                      ? "Continue"
                      : "Start Delivery",

                  onPressed: () {
                    if (order.status == "Pickup Required") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => PickupScreen()),
                      );
                    } else if (order.status == "Ready for Delivery") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => SealScreen()),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => PickupScreen()),
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: AppBottomNav(currentIndex: 0),
    );
  }
}
