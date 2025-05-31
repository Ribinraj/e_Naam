class BannerModel {
  final String bannerId;
  final String bannerAddress;
  final String link;
  final CreatedAt createdAt;
  final String modifiedAt;

  BannerModel({
    required this.bannerId,
    required this.bannerAddress,
    required this.link,
    required this.createdAt,
    required this.modifiedAt,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      bannerId: json['bannerId'],
      bannerAddress: json['bannerAddress'],
      link: json['link'] ?? '',
      createdAt: CreatedAt.fromJson(json['created_at']),
      modifiedAt: json['modified_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bannerId': bannerId,
      'bannerAddress': bannerAddress,
      'link': link,
      'created_at': createdAt.toJson(),
      'modified_at': modifiedAt,
    };
  }
}

class CreatedAt {
  final String date;
  final int timezoneType;
  final String timezone;

  CreatedAt({
    required this.date,
    required this.timezoneType,
    required this.timezone,
  });

  factory CreatedAt.fromJson(Map<String, dynamic> json) {
    return CreatedAt(
      date: json['date'],
      timezoneType: json['timezone_type'],
      timezone: json['timezone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'timezone_type': timezoneType,
      'timezone': timezone,
    };
  }
}
