// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDto _$OrderDtoFromJson(Map<String, dynamic> json) => OrderDto(
  orderId: json['orderId'] as String,
  status: json['status'] as String,
  price: json['price'] as String,
  items: json['items'] as String,
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  timer: json['timer'] as String?,
  isBreached: json['isBreached'] as bool,
);

Map<String, dynamic> _$OrderDtoToJson(OrderDto instance) => <String, dynamic>{
  'orderId': instance.orderId,
  'status': instance.status,
  'price': instance.price,
  'items': instance.items,
  'tags': instance.tags,
  'timer': instance.timer,
  'isBreached': instance.isBreached,
};
