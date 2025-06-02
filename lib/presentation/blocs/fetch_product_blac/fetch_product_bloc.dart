import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_naam/data/productmodel.dart';
import 'package:e_naam/domain/repositories/productrepo.dart';
import 'package:meta/meta.dart';

part 'fetch_product_event.dart';
part 'fetch_product_state.dart';

class FetchProductBloc extends Bloc<FetchProductEvent, FetchProductState> {
  final Productrepo repository;
  FetchProductBloc({required this.repository}) : super(FetchProductInitial()) {
    on<FetchProductEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<FetchProductButtonClickEvent>(fetchproduct);
  }

  FutureOr<void> fetchproduct(FetchProductButtonClickEvent event,
      Emitter<FetchProductState> emit) async {
    emit(FetchProductLoadingState());
    try {
      final response =
          await repository.fetchproducts(categoryId: event.categoryId);
      if (!response.error && response.status == 200) {
        emit(FethchProductSuccessState(products: response.data!));
      } else {
        emit(FetchProductErrorState(message: response.message));
      }
    } catch (e) {
      emit(FetchProductErrorState(message: e.toString()));
    }
  }
}
