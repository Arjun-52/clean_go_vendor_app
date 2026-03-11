class AppNotification {
  final String id;
  final String type;
  final String title;
  final String message;
  final String time;
  final bool isRead;
  final bool isHighPriority;

  AppNotification({
    required this.id,
    required this.type,
    required this.title,
    required this.message,
    required this.time,
    this.isRead = false,
    this.isHighPriority = false,
  });
}
