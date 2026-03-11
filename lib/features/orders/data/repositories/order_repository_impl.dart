import 'package:clean_go_vendor_app/core/enums/order_status.dart';
import 'package:clean_go_vendor_app/features/orders/domain/models/order_model.dart';
import 'package:clean_go_vendor_app/features/orders/domain/repositories/i_order_repository.dart';

class OrderRepositoryImpl implements IOrderRepository {
  @override
  Future<List<OrderModel>> getOrders() async {
    return [
      OrderModel(
        orderId: "ORD-2026-001",
        status: OrderStatus.pickupRequired,
        price: "₹486",
        items: "3 items • wash-iron",
        tags: ["BREACHED", "FAST"],
        timer: null,
        isBreached: true,
      ),
      OrderModel(
        orderId: "ORD-2026-002",
        status: OrderStatus.processing,
        price: "₹800",
        items: "6 items • wash-iron",
        tags: ["STANDARD"],
        timer: "05:22:30",
        isBreached: false,
      ),
      OrderModel(
        orderId: "ORD-2026-003",
        status: OrderStatus.readyForDelivery,
        price: "₹486",
        items: "3 items • wash-iron",
        tags: ["BREACHED", "FAST"],
        timer: null,
        isBreached: true,
      ),
    ];
  }
}
