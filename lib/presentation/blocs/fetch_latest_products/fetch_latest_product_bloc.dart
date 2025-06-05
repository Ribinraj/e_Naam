import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_naam/data/productmodel.dart';
import 'package:e_naam/domain/repositories/productrepo.dart';
import 'package:meta/meta.dart';

part 'fetch_latest_product_event.dart';
part 'fetch_latest_product_state.dart';

class FetchLatestProductBloc
    extends Bloc<FetchLatestProductEvent, FetchLatestProductState> {
  final Productrepo repository;
  FetchLatestProductBloc({required this.repository})
      : super(FetchLatestProductInitial()) {
    on<FetchLatestProductEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<FetchLatestProductInitialEvent>(fetchlatestproduct);
  }

  FutureOr<void> fetchlatestproduct(FetchLatestProductInitialEvent event,
      Emitter<FetchLatestProductState> emit) async {
    emit(FetchLatestProductsLoadingState());
    try {
      final response = await repository.fetchlatestproducts();
      if (!response.error && response.status == 200) {
        emit(FetchLatestProductSuccessState(latestproducts: response.data!));
      } else {
        emit(FetchLatestProductsErrorState(message: response.message));
      }
    } catch (e) {
      emit(FetchLatestProductsErrorState(message:e.toString()));
    }
  }
}
