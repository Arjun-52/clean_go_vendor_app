import 'package:clean_go_vendor_app/core/enums/order_status.dart';

class OrderModel {
  final String orderId;
  final OrderStatus status;
  final String price;
  final String items;
  final List<String> tags;
  final String? timer;
  final bool isBreached;

  OrderModel({
    required this.orderId,
    required this.status,
    required this.price,
    required this.items,
    required this.tags,
    this.timer,
    required this.isBreached,
  });
}