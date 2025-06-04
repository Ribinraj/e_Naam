class RedumptionrequestsModel {
  final String bannerId;
  final String bannerAddress;
  final String link;

  final String modifiedAt;

  RedumptionrequestsModel({
    required this.bannerId,
    required this.bannerAddress,
    required this.link,

    required this.modifiedAt,
  });

  factory RedumptionrequestsModel.fromJson(Map<String, dynamic> json) {
    return RedumptionrequestsModel(
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
