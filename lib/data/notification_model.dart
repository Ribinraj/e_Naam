class NotificationModel {
  final String notificationId;
  final String userId;
  final String notification;
  final String status;
  final CreatedAt createdAt;
  final String modifiedAt;

  NotificationModel({
    required this.notificationId,
    required this.userId,
    required this.notification,
    required this.status,
    required this.createdAt,
    required this.modifiedAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      notificationId: json['notificationId'],
      userId: json['userId'],
      notification: json['notification'],
      status: json['status'],
      createdAt: CreatedAt.fromJson(json['created_at']),
      modifiedAt: json['modified_at'],
    );
  }
}

class CreatedAt {
  final String date;
  final int timezoneType;
  final String timezone;

  CreatedAt({
    required this.date,
    required this.timezoneType,
    required this.timezone,
  });

  factory CreatedAt.fromJson(Map<String, dynamic> json) {
    return CreatedAt(
      date: json['date'],
      timezoneType: json['timezone_type'],
      timezone: json['timezone'],
    );
  }
}