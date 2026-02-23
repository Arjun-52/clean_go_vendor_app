import 'package:flutter/material.dart';
import 'package:clean_go_vendor_app/features/screens/home/screens/home_screen.dart';
import 'package:clean_go_vendor_app/features/screens/processing_screen/processign_screen.dart';
import 'package:clean_go_vendor_app/features/screens/delivery/delivery_screen.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;

  const AppBottomNav({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF0D3B66);

    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: primary,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        if (index == currentIndex) return;

        if (index == 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
          );
        }

        if (index == 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const ProcessingScreen()),
          );
        }

        if (index == 2) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const DeliveryScreen()),
          );
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.inventory_2),
          label: "Processing",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_shipping),
          label: "Delivery",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: "History",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
    );
  }
}