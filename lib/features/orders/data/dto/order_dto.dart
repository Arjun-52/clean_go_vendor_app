import 'package:json_annotation/json_annotation.dart';
import 'package:clean_go_vendor_app/core/enums/order_status.dart';
import 'package:clean_go_vendor_app/features/orders/domain/models/order_model.dart';

part 'order_dto.g.dart';

@JsonSerializable()
class OrderDto {
  final String orderId;
  final String status;
  final String price;
  final String items;
  final List<String> tags;
  final String? timer;
  final bool isBreached;

  OrderDto({
    required this.orderId,
    required this.status,
    required this.price,
    required this.items,
    required this.tags,
    this.timer,
    required this.isBreached,
  });

  factory OrderDto.fromJson(Map<String, dynamic> json) => _$OrderDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDtoToJson(this);

  OrderStatus _mapStatus(String statusStr) {
    switch (statusStr) {
      case 'Pickup Required':
        return OrderStatus.pickupRequired;
      case 'Processing':
        return OrderStatus.processing;
      case 'Ready for Delivery':
        return OrderStatus.readyForDelivery;
      default:
        return OrderStatus.processing; // Fallback
    }
  }

  OrderModel toDomain() {
    return OrderModel(
      orderId: orderId,
      status: _mapStatus(status),
      price: price,
      items: items,
      tags: tags,
      timer: timer,
      isBreached: isBreached,
    );
  }
}
