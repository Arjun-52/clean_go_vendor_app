import 'package:flutter/material.dart';
import 'package:clean_go_vendor_app/features/home/presentation/screens/home_screen.dart';
import 'package:clean_go_vendor_app/features/orders/presentation/screens/processing/processign_screen.dart';
import 'package:clean_go_vendor_app/features/orders/presentation/screens/delivery/delivery_screen.dart';
import 'package:clean_go_vendor_app/core/constants/app_colors.dart';
import 'package:clean_go_vendor_app/features/history/presentation/screens/history_screen.dart';
import 'package:clean_go_vendor_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:go_router/go_router.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;

  const AppBottomNav({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final color = AppColors.primary;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: color,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        if (index == currentIndex) return;

        Widget screen;

        switch (index) {
          case 0:
            screen = const HomeScreen();
            break;
          case 1:
            screen = const ProcessingScreen();
            break;
          case 2:
            screen = const DeliveryScreen();
            break;
          case 3:
            screen = const HistoryScreen();
            break;
          case 4:
            screen = const ProfileScreen();
            break;
          default:
            return;
        }

        if (screen is HomeScreen) {
          context.go('/home');
        } else if (screen is ProcessingScreen) {
          context.go('/processing');
        } else if (screen is DeliveryScreen) {
          context.go('/delivery');
        } else if (screen is HistoryScreen) {
          context.go('/history');
        } else if (screen is ProfileScreen) {
          context.go('/profile');
        }
      },
      items: [
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
    );
  }
}
