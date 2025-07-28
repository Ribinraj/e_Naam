import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_naam/data/fetch_happyclient.dart';
import 'package:e_naam/domain/repositories/productrepo.dart';
import 'package:meta/meta.dart';

part 'fetch_happyclients_event.dart';
part 'fetch_happyclients_state.dart';

class FetchHappyclientsBloc
    extends Bloc<FetchHappyclientsEvent, FetchHappyclientsState> {
  final Productrepo repository;
  FetchHappyclientsBloc({required this.repository})
      : super(FetchHappyclientsInitial()) {
    on<FetchHappyclientsEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<FetchHappyclientsInitialEvent>(fetchhappyclients);
  }

  FutureOr<void> fetchhappyclients(FetchHappyclientsInitialEvent event,
      Emitter<FetchHappyclientsState> emit) async {
    emit(FetchHappyClientsLoadingState());
    try {
      final response = await repository.fetchhappiclients();
      if (!response.error && response.status == 200) {
        emit(FetchHappyclientsSuccessState(happiclients: response.data!));
      } else {
        emit(FetchHappyclientsErrorState(message: response.message));
      }
    } catch (e) {
      emit(FetchHappyclientsErrorState(message: e.toString()));
    }
  }
}
