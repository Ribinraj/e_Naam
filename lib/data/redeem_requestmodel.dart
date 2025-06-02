class RedeemRequestModel {
  final String productId;
  final String recipientName;
  final String deliveryAddress;
  final String deliveryCity;
  final String deliveryState;
  final String deliveryCountry;
  final String deliveryPinCode;

  RedeemRequestModel({
    required this.productId,
    required this.recipientName,
    required this.deliveryAddress,
    required this.deliveryCity,
    required this.deliveryState,
    required this.deliveryCountry,
    required this.deliveryPinCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'recipientName': recipientName,
      'deliveryAddress': deliveryAddress,
      'deliveryCity': deliveryCity,
      'deliveryState': deliveryState,
      'deliveryCountry': deliveryCountry,
      'deliveryPinCode': deliveryPinCode,
    };
  }
}
