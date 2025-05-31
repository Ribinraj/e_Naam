class UpdateProfilemodel {
  final String? userFullName;
  final String? userOccupation;
  final String? userUPIAddress;
  final String? panCardID;
  final String? adharCardID;
  final String? address;
  final String? gst;
  final String? pushToken;

  UpdateProfilemodel({
    this.userFullName,
    this.userOccupation,
    this.userUPIAddress,
    this.panCardID,
    this.adharCardID,
    this.address,
    this.gst,
    this.pushToken,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (userFullName != null && userFullName!.isNotEmpty) {
      data['userFullName'] = userFullName;
    }
    if (userOccupation != null && userOccupation!.isNotEmpty) {
      data['userOccupation'] = userOccupation;
    }
    if (userUPIAddress != null && userUPIAddress!.isNotEmpty) {
      data['userUPIAddress'] = userUPIAddress;
    }
    if (panCardID != null && panCardID!.isNotEmpty) {
      data['panCardID'] = panCardID;
    }
    if (adharCardID != null && adharCardID!.isNotEmpty) {
      data['adharCardID'] = adharCardID;
    }
    if (address != null && address!.isNotEmpty) {
      data['address'] = address;
    }
    if (gst != null && gst!.isNotEmpty) {
      data['gst'] = gst;
    }
    if (pushToken != null && pushToken!.isNotEmpty) {
      data['pushToken'] = pushToken;
    }

    return data;
  }
}
