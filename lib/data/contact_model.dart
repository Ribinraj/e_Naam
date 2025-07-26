class ContactInfoModel {
  final String id;
  final String mobileNumber;
  final String emailAddress;
  final String address;
  final String website;
  final String fbLink;
  final String instaLink;
  final String whatsappNumber;
  final DateTime createdAt;
  final DateTime modifiedAt;

  ContactInfoModel({
    required this.id,
    required this.mobileNumber,
    required this.emailAddress,
    required this.address,
    required this.website,
    required this.fbLink,
    required this.instaLink,
    required this.whatsappNumber,
    required this.createdAt,
    required this.modifiedAt,
  });

  factory ContactInfoModel.fromJson(Map<String, dynamic> json) {
    return ContactInfoModel(
      id: json['id'] ?? '',
      mobileNumber: json['mobileNumber'] ?? '',
      emailAddress: json['emailAddress'] ?? '',
      address: json['address'] ?? '',
      website: json['website'] ?? '',
      fbLink: json['fb_link'] ?? '',
      instaLink: json['insta_link'] ?? '',
      whatsappNumber: json['whatsappNumber'] ?? '',
      createdAt: DateTime.parse(json['created_at']['date']),
      modifiedAt: DateTime.parse(json['modified_at']),
    );
  }
}
