// class ProfileModel {
//   final String userId;
//   final String userMobileNumber;
//   final String userLoginOTP;
//   final String userFullName;
//   final String userOccupation;
//   final String userUPIAddress;
//   final String panCardID;
//   final String adharCardID;
//   final String address;
//   final String gst;
//   final String userPoints;
//   final String pushToken;
//   final CreatedAt createdAt;
//   final String modifiedAt;

//   ProfileModel({
//     required this.userId,
//     required this.userMobileNumber,
//     required this.userLoginOTP,
//     required this.userFullName,
//     required this.userOccupation,
//     required this.userUPIAddress,
//     required this.panCardID,
//     required this.adharCardID,
//     required this.address,
//     required this.gst,
//     required this.userPoints,
//     required this.pushToken,
//     required this.createdAt,
//     required this.modifiedAt,
//   });

//   factory ProfileModel.fromJson(Map<String, dynamic> json) {
//     return ProfileModel(
//       userId: json['userId']??"",
//       userMobileNumber: json['userMobileNumber']??"",
//       userLoginOTP: json['userLoginOTP']??"",
//       userFullName: json['userFullName']??"",
//       userOccupation: json['userOccupation']??"",
//       userUPIAddress: json['userUPIAddress']??"",
//       panCardID: json['panCardID']??"",
//       adharCardID: json['adharCardID']??"",
//       address: json['address']??"",
//       gst: json['gst']??"",
//       userPoints: json['userPoints']??"",
//       pushToken: json['pushToken']??"",
//       createdAt: CreatedAt.fromJson(json['created_at']??""),
//       modifiedAt: json['modified_at']??"",
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'userId': userId,
//       'userMobileNumber': userMobileNumber,
//       'userLoginOTP': userLoginOTP,
//       'userFullName': userFullName,
//       'userOccupation': userOccupation,
//       'userUPIAddress': userUPIAddress,
//       'panCardID': panCardID,
//       'adharCardID': adharCardID,
//       'address': address,
//       'gst': gst,
//       'userPoints': userPoints,
//       'pushToken': pushToken,
//       'created_at': createdAt.toJson(),
//       'modified_at': modifiedAt,
//     };
//   }
// }

// class CreatedAt {
//   final String date;
//   final int timezoneType;
//   final String timezone;

//   CreatedAt({
//     required this.date,
//     required this.timezoneType,
//     required this.timezone,
//   });

//   factory CreatedAt.fromJson(Map<String, dynamic> json) {
//     return CreatedAt(
//       date: json['date'],
//       timezoneType: json['timezone_type'],
//       timezone: json['timezone'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'date': date,
//       'timezone_type': timezoneType,
//       'timezone': timezone,
//     };
//   }
// }
////////////////////////////
class ProfileModel {
  final String userId;
  final String userMobileNumber;
  final String userFullName;
  final String userOccupation;
  final String userUPIAddress;
  final String panCardID;
  final String adharCardID;
  final String address;
  final String gst;
  final String userPoints;
  final String pushToken;
  final String profileStatus;

  ProfileModel( {
    required this.userId,
    required this.userMobileNumber,
    required this.userFullName,
    required this.userOccupation,
    required this.userUPIAddress,
    required this.panCardID,
    required this.adharCardID,
    required this.address,
    required this.gst,
    required this.userPoints,
    required this.pushToken,
    required this.profileStatus,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      userId: json['userId'] ?? "",
      userMobileNumber: json['userMobileNumber'] ?? "",
      userFullName: json['userFullName'] ?? "",
      userOccupation: json['userOccupation'] ?? "",
      userUPIAddress:json['userUPIAddress'] ??"",
      panCardID: json['panCardID'] ?? "",
      adharCardID: json['adharCardID'] ?? "",
      address: json['address'] ?? "",
      gst: json['gst'] ?? "",
      userPoints: json['userPoints'] ?? "",
      pushToken: json['pushToken'] ?? "",
      profileStatus: json['profileStatus'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userMobileNumber': userMobileNumber,
      'userFullName': userFullName,
      'userOccupation': userOccupation,
      'userUPIAddress':userUPIAddress,
      'panCardID': panCardID,
      'adharCardID': adharCardID,
      'address': address,
      'gst': gst,
      'userPoints': userPoints,
      'pushToken': pushToken,
      'profileStatus': profileStatus,
    };
  }
}
