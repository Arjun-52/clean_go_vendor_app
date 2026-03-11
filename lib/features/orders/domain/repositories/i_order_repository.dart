import 'package:clean_go_vendor_app/features/orders/domain/models/order_model.dart';

abstract class IOrderRepository {
  Future<List<OrderModel>> getOrders();
}
