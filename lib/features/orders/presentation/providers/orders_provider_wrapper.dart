import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clean_go_vendor_app/features/orders/presentation/providers/order_provider.dart';
import 'package:clean_go_vendor_app/features/orders/domain/repositories/i_order_repository.dart';
import 'package:clean_go_vendor_app/core/di/service_locator.dart';

class OrdersProviderWrapper extends StatelessWidget {
  final Widget child;

  const OrdersProviderWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OrderProvider(getIt<IOrderRepository>())..fetchOrders(),
      child: child,
    );
  }
}
