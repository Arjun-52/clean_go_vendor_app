import 'package:clean_go_vendor_app/features/auth/presentation/screens/login_screen.dart';
import 'package:clean_go_vendor_app/features/orders/presentation/providers/order_provider.dart';
import 'package:clean_go_vendor_app/features/orders/data/repositories/order_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => OrderProvider(OrderRepositoryImpl())..fetchOrders(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: const LoginScreen(),
      ),
    );
  }
}
