part of 'redumption_requests_bloc.dart';

@immutable
sealed class RedumptionRequestsEvent {}
final class RedumptionRequestsFetchingInitialEvent extends RedumptionRequestsEvent{}