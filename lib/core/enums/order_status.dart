enum OrderStatus {
  pickupRequired,
  processing,
  readyForDelivery,
}

extension OrderStatusExtension on OrderStatus {
  String get displayName {
    switch (this) {
      case OrderStatus.pickupRequired:
        return "Pickup Required";
      case OrderStatus.processing:
        return "Processing";
      case OrderStatus.readyForDelivery:
        return "Ready for Delivery";
    }
  }
}
