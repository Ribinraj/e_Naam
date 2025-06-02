part of 'redeem_request_bloc.dart';

@immutable
sealed class RedeemRequestEvent {}

final class RedeeRequestButtonClickEvent extends RedeemRequestEvent {
  final RedeemRequestModel request;

  RedeeRequestButtonClickEvent({required this.request});
}
