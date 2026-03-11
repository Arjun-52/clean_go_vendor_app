import 'package:clean_go_vendor_app/features/auth/presentation/screens/login_screen.dart';
import 'package:clean_go_vendor_app/features/orders/presentation/providers/order_provider.dart';
import 'package:clean_go_vendor_app/features/orders/domain/repositories/i_order_repository.dart';
import 'package:clean_go_vendor_app/core/di/service_locator.dart';
import 'package:clean_go_vendor_app/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => OrderProvider(getIt<IOrderRepository>())..fetchOrders(),
        )
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        routerConfig: appRouter,
      ),
    );
  }
}
