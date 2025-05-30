class VerifyOtpmodel {
  final String userId;
  final String userLoginotp;
  final String? userFullName;
  final String? userOccupation;
  final String pushToken;

  VerifyOtpmodel({required this.userId, required this.userLoginotp,  this.userFullName,  this.userOccupation,required  this.pushToken});



  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userLoginOTP': userLoginotp,
      if (userFullName != null) 'userFullName': userFullName,
      if (userOccupation != null) 'userOccupation': userOccupation,
      'pushToken': pushToken,
    };
  }
}
