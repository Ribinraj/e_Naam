part of 'fetch_notification_bloc.dart';

@immutable
sealed class FetchNotificationState {}

final class FetchNotificationInitial extends FetchNotificationState {}

final class FetchNotificationLoadingState extends FetchNotificationState {}

final class FetchNotificationSuccessState extends FetchNotificationState {
  final List<NotificationModel> notifications;

  FetchNotificationSuccessState({required this.notifications});
}

final class FetchNotificationsErrorState extends FetchNotificationState {
  final String message;

  FetchNotificationsErrorState({required this.message});
}
