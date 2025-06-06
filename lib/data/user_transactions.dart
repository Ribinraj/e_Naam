class UserTransactionModel {
  final String userTransactionId;
  final String userId;
  final String transactionType;
  final String codeId;
  final String transactionDateTime;
  final String points;
  final String status;
  final DateTime createdAt;
  final String modifiedAt;

  UserTransactionModel({
    required this.userTransactionId,
    required this.userId,
    required this.transactionType,
    required this.codeId,
    required this.transactionDateTime,
    required this.points,
    required this.status,
    required this.createdAt,
    required this.modifiedAt,
  });

  factory UserTransactionModel.fromJson(Map<String, dynamic> json) {
    return UserTransactionModel(
      userTransactionId: json['userTransactionId']??"",
      userId: json['userId']??"",
      transactionType: json['transactionType']??"",
      codeId: json['codeId']??"",
      transactionDateTime: json['transactionDateTime']??"",
      points: json['points']??"",
      status: json['status']??"",
      createdAt: DateTime.tryParse(json['created_at']?['date'] ?? '') ?? DateTime.now(),

      modifiedAt: json['modified_at']??"",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userTransactionId': userTransactionId,
      'userId': userId,
      'transactionType': transactionType,
      'codeId': codeId,
      'transactionDateTime': transactionDateTime,
      'points': points,
      'status': status,
      'created_at': {
        'date': createdAt.toIso8601String(),
        'timezone_type': 3,
        'timezone': 'UTC'
      },
      'modified_at': modifiedAt,
    };
  }
}
