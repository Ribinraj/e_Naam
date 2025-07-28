part of 'fetch_happyclients_bloc.dart';

@immutable
sealed class FetchHappyclientsEvent {}
final class FetchHappyclientsInitialEvent extends FetchHappyclientsEvent{}