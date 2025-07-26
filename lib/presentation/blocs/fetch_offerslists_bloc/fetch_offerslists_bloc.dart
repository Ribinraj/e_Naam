import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_naam/data/offers_model.dart';
import 'package:e_naam/domain/repositories/productrepo.dart';
import 'package:meta/meta.dart';

part 'fetch_offerslists_event.dart';
part 'fetch_offerslists_state.dart';

class FetchOfferslistsBloc
    extends Bloc<FetchOfferslistsEvent, FetchOfferslistsState> {
  final Productrepo repository;
  FetchOfferslistsBloc({required this.repository})
      : super(FetchOfferslistsInitial()) {
    on<FetchOfferslistsEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<FetchOfferslistsInitialEvent>(fetchoffers);
  }

  FutureOr<void> fetchoffers(FetchOfferslistsInitialEvent event,
      Emitter<FetchOfferslistsState> emit) async {
    emit(FetchoffersLoadingState());
    try {
      final response = await repository.fetchoffers();
      if (!response.error && response.status == 200) {
        emit(FetchoffersSuccessState(offers: response.data!));
      } else {
        emit(FetchOffersErrorState(message: response.message));
      }
    } catch (e) {
      emit(FetchOffersErrorState(message: e.toString()));
    }
  }
}
