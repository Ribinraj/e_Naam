part of 'fetch_happyclients_bloc.dart';

@immutable
sealed class FetchHappyclientsState {}

final class FetchHappyclientsInitial extends FetchHappyclientsState {}

final class FetchHappyClientsLoadingState extends FetchHappyclientsState {}

final class FetchHappyclientsSuccessState extends FetchHappyclientsState {
  final List<HappyClientModel> happiclients;

  FetchHappyclientsSuccessState({required this.happiclients});
}

final class FetchHappyclientsErrorState extends FetchHappyclientsState {
  final String message;

  FetchHappyclientsErrorState({required this.message});
}
