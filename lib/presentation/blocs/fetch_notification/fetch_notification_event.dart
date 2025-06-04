part of 'fetch_notification_bloc.dart';

@immutable
sealed class FetchNotificationEvent {}
final class FetchNotificationInitialEvent extends FetchNotificationEvent{}