class OrderModel {
  final String orderId;
  final String status;
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
