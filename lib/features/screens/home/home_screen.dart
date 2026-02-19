import 'package:flutter/material.dart';
import 'package:clean_go_vendor_app/features/orders/pickup_screen.dart';
import 'package:clean_go_vendor_app/features/orders/seal_screen.dart';
import 'package:clean_go_vendor_app/widgets/filter_chip_widget.dart';
import 'package:clean_go_vendor_app/widgets/order_card.dart';
import 'package:clean_go_vendor_app/widgets/stat_card.dart';
import 'package:clean_go_vendor_app/models/order_model.dart';

import '../notifications/notifications_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilterChipWidget(
                    text: "All",
                    selected: selectedFilter == "All",
                    onTap: () {
                      setState(() {
                        selectedFilter = "All";
                      });
                    },
                  ),
                  FilterChipWidget(
                    text: "Pickup",
                    selected: selectedFilter == "Pickup",
                    onTap: () {
                      setState(() {
                        selectedFilter = "Pickup";
                      });
                    },
                  ),
                  FilterChipWidget(
                    text: "Processing",
                    selected: selectedFilter == "Processing",
                    onTap: () {
                      setState(() {
                        selectedFilter = "Processing";
                      });
                    },
                  ),
                  FilterChipWidget(
                    text: "Delivery",
                    selected: selectedFilter == "Delivery",
                    onTap: () {
                      setState(() {
                        selectedFilter = "Delivery";
                      });
                    },
                  ),
                ],
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
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primary,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2),
            label: "Processing",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping),
            label: "Delivery",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
