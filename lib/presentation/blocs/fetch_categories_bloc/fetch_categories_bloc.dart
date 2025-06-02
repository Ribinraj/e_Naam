import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_naam/data/category_model.dart';
import 'package:e_naam/domain/repositories/productrepo.dart';
import 'package:meta/meta.dart';

part 'fetch_categories_event.dart';
part 'fetch_categories_state.dart';

class FetchCategoriesBloc
    extends Bloc<FetchCategoriesEvent, FetchCategoriesState> {
  final Productrepo repository;
  FetchCategoriesBloc({required this.repository})
      : super(FetchCategoriesInitial()) {
    on<FetchCategoriesEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<FetchCategoriesInitialeEvent>(fetchcategories);
  }

  FutureOr<void> fetchcategories(FetchCategoriesInitialeEvent event,
      Emitter<FetchCategoriesState> emit) async {
    emit(FetchCategoriesLoadingState());
    try {
      final response = await repository.fetchcategories();
      if (!response.error && response.status == 200) {
        emit(FetchCategoriesSuccessState(categories: response.data!));
      } else {
        emit(FetchCategoriesErrorState(message: response.message));
      }
    } catch (e) {
      emit(FetchCategoriesErrorState(message: e.toString()));
    }
  }
}
