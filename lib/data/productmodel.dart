class ProductModel {
  final String productId;
  final String categoryId;
  final String productName;
  final String productPicture;
  final String redeemPoints;
  final String description;
  final String status;
  final DateTime createdAt;
  final String modifiedAt;

  ProductModel({
    required this.productId,
    required this.categoryId,
    required this.productName,
    required this.productPicture,
    required this.redeemPoints,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.modifiedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productId: json['productId'] ?? '',
      categoryId: json['categoryId'] ?? '',
      productName: json['productName'] ?? '',
      productPicture: json['productPicture'] ?? '',
      redeemPoints: json['redeemPoints'] ?? '',
      description: json['description'] ?? '',
      status: json['status'] ?? '',
      createdAt: DateTime.parse(json['created_at']['date']),
      modifiedAt: json['modified_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'categoryId': categoryId,
      'productName': productName,
      'productPicture': productPicture,
      'redeemPoints': redeemPoints,
      'description': description,
      'status': status,
      'created_at': {
        'date': createdAt.toIso8601String(),
        'timezone_type': 3,
        'timezone': 'UTC',
      },
      'modified_at': modifiedAt,
    };
  }
}
