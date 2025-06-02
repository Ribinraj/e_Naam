part of 'redeem_request_bloc.dart';

@immutable
sealed class RedeemRequestState {}

final class RedeemRequestInitial extends RedeemRequestState {}

final class RedeemRequestLoadingState extends RedeemRequestState {}

final class RedeemRequestSuccessState extends RedeemRequestState {
  final String message;

  RedeemRequestSuccessState({required this.message});
}

final class RedeemRequestErrorState extends RedeemRequestState {
  final String message;

  RedeemRequestErrorState({required this.message});
}
