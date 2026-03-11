import 'package:json_annotation/json_annotation.dart';
import 'package:clean_go_vendor_app/features/notifications/domain/models/notification_model.dart';

part 'notification_dto.g.dart';

@JsonSerializable()
class NotificationDto {
  final String id;
  final String type;
  final String title;
  final String message;
  final String time;
  final bool isRead;
  final bool isHighPriority;

  NotificationDto({
    required this.id,
    required this.type,
    required this.title,
    required this.message,
    required this.time,
    this.isRead = false,
    this.isHighPriority = false,
  });

  factory NotificationDto.fromJson(Map<String, dynamic> json) => _$NotificationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationDtoToJson(this);

  AppNotification toDomain() {
    return AppNotification(
      id: id,
      type: type,
      title: title,
      message: message,
      time: time,
      isRead: isRead,
      isHighPriority: isHighPriority,
    );
  }
}
