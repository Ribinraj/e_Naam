class HappyClientModel {
  final String id;
  final String picture;
  final String status;
  final DateTime createdAt;
  final DateTime modifiedAt;

  HappyClientModel({
    required this.id,
    required this.picture,
    required this.status,
    required this.createdAt,
    required this.modifiedAt,
  });

  factory HappyClientModel.fromJson(Map<String, dynamic> json) {
    return HappyClientModel(
      id: json['id'] ?? '',
      picture: json['picture'] ?? '',
      status: json['status'] ?? '',
      createdAt: DateTime.parse(json['created_at']['date']),
      modifiedAt: DateTime.parse(json['modified_at']),
    );
  }
}
