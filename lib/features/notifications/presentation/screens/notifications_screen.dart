import 'package:clean_go_vendor_app/features/notifications/domain/models/notification_model.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  String selectedFilter = "All";

  List<AppNotification> notifications = [
    AppNotification(
      id: "1",
      type: "order",
      title: "New Order Assigned",
      message: "Order ORD-2026-002 • ₹420 • Madhapur",
      time: "2 min ago",
      isHighPriority: true,
    ),
    AppNotification(
      id: "2",
      type: "order",
      title: "Order Breached",
      message: "Order ORD-2026-002 exceeded SLA",
      time: "10 min ago",
      isHighPriority: true,
    ),
    AppNotification(
      id: "3",
      type: "payment",
      title: "Payment Credited",
      message: "₹3,250 added to wallet",
      time: "2 hrs ago",
      isRead: true,
    ),
    AppNotification(
      id: "4",
      type: "system",
      title: "App Maintenance Scheduled",
      message: "Scheduled at 2:00 AM tonight",
      time: "Yesterday",
      isRead: true,
    ),
  ];

  Color getTypeColor(String type) {
    switch (type) {
      case "order":
        return Colors.blue;
      case "payment":
        return Colors.green;
      case "system":
        return Colors.grey;
      default:
        return Colors.black;
    }
  }

  IconData getTypeIcon(String type) {
    switch (type) {
      case "order":
        return Icons.local_shipping;
      case "payment":
        return Icons.account_balance_wallet;
      case "system":
        return Icons.settings;
      default:
        return Icons.notifications;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<AppNotification> filteredNotifications = selectedFilter == "All"
        ? notifications
        : notifications
              .where((n) => n.type == selectedFilter.toLowerCase())
              .toList();

    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Notifications",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),

          /// Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: ["All", "Order", "Payment", "System"]
                  .map(
                    (filter) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ChoiceChip(
                        label: Text(filter),
                        selected: selectedFilter == filter,
                        onSelected: (value) {
                          setState(() {
                            selectedFilter = filter;
                          });
                        },
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),

          const SizedBox(height: 10),

          /// Notification List
          Expanded(
            child: ListView.builder(
              itemCount: filteredNotifications.length,
              itemBuilder: (context, index) {
                final notif = filteredNotifications[index];

                return Dismissible(
                  key: Key(notif.id),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (_) {
                    setState(() {
                      notifications.removeWhere(
                        (element) => element.id == notif.id,
                      );
                    });
                  },
                  background: Container(
                    color: Colors.green,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: const Icon(Icons.check, color: Colors.white),
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: notif.isRead
                          ? Colors.white
                          : Colors.blue.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        /// Icon
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: getTypeColor(notif.type).withOpacity(0.15),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            getTypeIcon(notif.type),
                            color: getTypeColor(notif.type),
                          ),
                        ),

                        const SizedBox(width: 14),

                        /// Text Content
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notif.title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                notif.message,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                notif.time,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
