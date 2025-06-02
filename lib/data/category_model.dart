class CategoryModel {
  final String categoryId;
  final String categoryName;
  final String categoryImage;
  final String categoryStatus;
  final DateTime createdAt;
  final String modifiedAt;

  CategoryModel({
    required this.categoryId,
    required this.categoryName,
    required this.categoryImage,
    required this.categoryStatus,
    required this.createdAt,
    required this.modifiedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryId: json['categoryId'] ?? '',
      categoryName: json['categoryName'] ?? '',
      categoryImage: json['categoryImage'] ?? '',
      categoryStatus: json['categoryStatus'] ?? '',
      createdAt: DateTime.parse(json['created_at']['date']),
      modifiedAt: json['modified_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryId': categoryId,
      'categoryName': categoryName,
      'categoryImage': categoryImage,
      'categoryStatus': categoryStatus,
      'created_at': {
        'date': createdAt.toIso8601String(),
        'timezone_type': 3,
        'timezone': 'UTC',
      },
      'modified_at': modifiedAt,
    };
  }
}
