class TransactionsModel {
  final String bannerId;
  final String bannerAddress;
  final String link;

  final String modifiedAt;

  TransactionsModel({
    required this.bannerId,
    required this.bannerAddress,
    required this.link,

    required this.modifiedAt,
  });

  factory TransactionsModel.fromJson(Map<String, dynamic> json) {
    return TransactionsModel(
      bannerId: json['bannerId'],
      bannerAddress: json['bannerAddress'],
      link: json['link'] ?? '',

      modifiedAt: json['modified_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bannerId': bannerId,
      'bannerAddress': bannerAddress,
      'link': link,

      'modified_at': modifiedAt,
    };
  }
}
