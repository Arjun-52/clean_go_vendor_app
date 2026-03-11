import 'package:flutter/foundation.dart';
import 'package:clean_go_vendor_app/features/orders/domain/models/order_model.dart';
import 'package:clean_go_vendor_app/features/orders/domain/repositories/i_order_repository.dart';
import 'package:clean_go_vendor_app/core/enums/order_status.dart';
import 'package:clean_go_vendor_app/core/errors/errors.dart';

class OrderProvider extends ChangeNotifier {
  final IOrderRepository _repository;
  List<OrderModel> _orders = [];
  bool _isLoading = false;
  String _selectedFilter = 'All';
  AppException? _error;

  OrderProvider(this._repository);

  bool get isLoading => _isLoading;
  AppException? get error => _error;
  bool get hasError => _error != null;

  Future<void> fetchOrders() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await ErrorHandler.safeExecute(() async {
        _orders = await _repository.getOrders();
      }, context: 'OrderProvider.fetchOrders');
    } catch (error) {
      _error = error as AppException;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  String get selectedFilter => _selectedFilter;

  void setFilter(String filter) {
    if (_selectedFilter != filter) {
      _selectedFilter = filter;
      notifyListeners();
    }
  }

  List<OrderModel> get filteredOrders {
    if (_selectedFilter == "All") return _orders;

    if (_selectedFilter == "Pickup") {
      return _orders
          .where((order) => order.status == OrderStatus.pickupRequired)
          .toList();
    }

    if (_selectedFilter == "Processing") {
      return _orders
          .where((order) => order.status == OrderStatus.processing)
          .toList();
    }

    if (_selectedFilter == "Delivery") {
      return _orders
          .where((order) => order.status == OrderStatus.readyForDelivery)
          .toList();
    }

    return _orders;
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
    _error = null;
    notifyListeners();
  }

  /// Clear error state
  void clearError() {
    _error = null;
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
