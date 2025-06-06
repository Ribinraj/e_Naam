class RedumptionrequestsModel {
  final String requestId;
  final String userId;
  final String productId;
  final String recipientName;
  final String deliveryAddress;
  final String deliveryCity;
  final String deliveryState;
  final String deliveryCountry;
  final String deliveryPinCode;
  final String currentPoints;
  final String redemptionPoints;
  final String redeptionDate;
  final String status;
  final String updatedBy;
  final DateTime createdAt;
  final String modifiedAt;
  final String productName;
  final String productPicture;

  RedumptionrequestsModel({
    required this.requestId,
    required this.userId,
    required this.productId,
    required this.recipientName,
    required this.deliveryAddress,
    required this.deliveryCity,
    required this.deliveryState,
    required this.deliveryCountry,
    required this.deliveryPinCode,
    required this.currentPoints,
    required this.redemptionPoints,
    required this.redeptionDate,
    required this.status,
    required this.updatedBy,
    required this.createdAt,
    required this.modifiedAt,
    required this.productName,
    required this.productPicture,
  });

  factory RedumptionrequestsModel.fromJson(Map<String, dynamic> json) {
    return RedumptionrequestsModel(
      requestId: json['requestId'] ?? "",
      userId: json['userId'] ?? "",
      productId: json['productId'] ?? "",
      recipientName: json['recipientName'] ?? "",
      deliveryAddress: json['deliveryAddress'] ?? "",
      deliveryCity: json['deliveryCity'] ?? "",
      deliveryState: json['deliveryState'] ?? "",
      deliveryCountry: json['deliveryCountry'] ?? "",
      deliveryPinCode: json['deliveryPinCode'] ?? "",
      currentPoints: json['currentPoints'] ?? "",
      redemptionPoints: json['redemptionPoints'] ?? "",
      redeptionDate: json['redeptionDate'] ?? "",
      status: json['status'] ?? "",
      updatedBy: json['updatedBy'] ?? "",
      createdAt: DateTime.tryParse(json['created_at']?['date'] ?? "") ?? DateTime.now(),
      modifiedAt: json['modified_at'] ?? "",
      productName: json['productName'] ?? "",
      productPicture: json['productPicture'] ?? "",
    );
  }
}
