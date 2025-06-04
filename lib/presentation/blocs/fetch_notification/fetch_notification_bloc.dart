import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_naam/data/notification_model.dart';
import 'package:e_naam/domain/repositories/productrepo.dart';
import 'package:meta/meta.dart';

part 'fetch_notification_event.dart';
part 'fetch_notification_state.dart';

class FetchNotificationBloc
    extends Bloc<FetchNotificationEvent, FetchNotificationState> {
  final Productrepo repository;
  FetchNotificationBloc({required this.repository})
      : super(FetchNotificationInitial()) {
    on<FetchNotificationEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<FetchNotificationInitialEvent>(fetchnotification);
  }

  FutureOr<void> fetchnotification(FetchNotificationInitialEvent event,
      Emitter<FetchNotificationState> emit) async {
    emit(FetchNotificationLoadingState());
    try {
      final response = await repository.fetchnotifications();
      if (!response.error && response.status == 200) {
        emit(FetchNotificationSuccessState(notifications: response.data!));
      } else {
        emit(FetchNotificationsErrorState(message: response.message));
      }
    } catch (e) {
      emit(FetchNotificationsErrorState(message: e.toString()));
    }
  }
}
