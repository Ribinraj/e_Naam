class OfferModel {
  final String offerId;
  final String profile;
  final String offer;
  final String offerPicture;
  final String validFrom;
  final String validTo;
  final String status;
  final DateTime createdAt;
  final DateTime modifiedAt;

  OfferModel({
    required this.offerId,
    required this.profile,
    required this.offer,
    required this.offerPicture,
    required this.validFrom,
    required this.validTo,
    required this.status,
    required this.createdAt,
    required this.modifiedAt,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      offerId: json['offerId'] ?? '',
      profile: json['profile'] ?? '',
      offer: json['offer'] ?? '',
      offerPicture: json['offerPicture'] ?? '',
      validFrom: json['validFrom'] ?? '',
      validTo: json['validTo'] ?? '',
      status: json['status'] ?? '',
      createdAt: DateTime.parse(json['created_at']?['date'] ?? DateTime.now().toIso8601String()),
      modifiedAt: DateTime.parse(json['modified_at'] ?? DateTime.now().toIso8601String()),
    );
  }
}
