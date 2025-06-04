part of 'redumption_requests_bloc.dart';

@immutable
sealed class RedumptionRequestsState {}

final class RedumptionRequestsInitial extends RedumptionRequestsState {}

final class RedumptionRequestsLoadingState extends RedumptionRequestsState {}

final class RedumptionRequestsSuccessState extends RedumptionRequestsState {
  final List<RedumptionrequestsModel> redumptionrequests;

  RedumptionRequestsSuccessState({required this.redumptionrequests});
}

final class RedumptionsRequestsErrorState extends RedumptionRequestsState {
  final String message;

  RedumptionsRequestsErrorState({required this.message});
}
