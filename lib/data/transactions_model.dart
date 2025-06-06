class TransactionsModel {
  final String? userTransactionId;
  final String? userId;
  final String? transactionType;
  final String? codeId;
  final String? transactionDateTime;
  final String? points;
  final String? status;
  final DateTime? createdAt;
  final String? modifiedAt;

  TransactionsModel({
    this.userTransactionId,
    this.userId,
    this.transactionType,
    this.codeId,
    this.transactionDateTime,
    this.points,
    this.status,
    this.createdAt,
    this.modifiedAt,
  });

  factory TransactionsModel.fromJson(Map<String, dynamic> json) {
    return TransactionsModel(
      userTransactionId: json['userTransactionId']?.toString(),
      userId: json['userId']?.toString(),
      transactionType: json['transactionType']?.toString(),
      codeId: json['codeId']?.toString(),
      transactionDateTime: json['transactionDateTime']?.toString(),
      points: json['points']?.toString(),
      status: json['status']?.toString(),
      createdAt: DateTime.tryParse(json['created_at']?['date'] ?? ""),
      modifiedAt: json['modified_at']?.toString(),
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
        'date': createdAt?.toIso8601String(),
        'timezone_type': 3,
        'timezone': 'UTC'
      },
      'modified_at': modifiedAt,
    };
  }
}
