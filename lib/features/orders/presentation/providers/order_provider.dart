import 'package:flutter/foundation.dart';
import 'package:clean_go_vendor_app/features/orders/domain/models/order_model.dart';
import 'package:clean_go_vendor_app/features/orders/domain/repositories/i_order_repository.dart';

class OrderProvider extends ChangeNotifier {
  final IOrderRepository _repository;
  List<OrderModel> _orders = [];
  bool _isLoading = false;

  OrderProvider(this._repository);

  bool get isLoading => _isLoading;

  Future<void> fetchOrders() async {
    _isLoading = true;
    notifyListeners();
    
    try {
      _orders = await _repository.getOrders();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Public getter for orders list
  List<OrderModel> get orders => List.unmodifiable(_orders);

  /// Set the entire orders list
  void setOrders(List<OrderModel> orders) {
    _orders = List.from(orders);
    notifyListeners();
  }

  /// Add a single order to the list
  void addOrder(OrderModel order) {
    _orders.add(order);
    notifyListeners();
  }

  /// Clear all orders
  void clearOrders() {
    _orders.clear();
    notifyListeners();
  }

  /// Remove a specific order by index
  void removeOrderAt(int index) {
    if (index >= 0 && index < _orders.length) {
      _orders.removeAt(index);
      notifyListeners();
    }
  }

  /// Update a specific order by index
  void updateOrderAt(int index, OrderModel order) {
    if (index >= 0 && index < _orders.length) {
      _orders[index] = order;
      notifyListeners();
    }
  }

  /// Get order count
  int get orderCount => _orders.length;

  /// Check if orders list is empty
  bool get hasOrders => _orders.isNotEmpty;
}
