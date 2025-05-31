import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_naam/data/banner_model.dart';
import 'package:e_naam/domain/repositories/productrepo.dart';
import 'package:meta/meta.dart';

part 'fetch_banners_event.dart';
part 'fetch_banners_state.dart';

class FetchBannersBloc extends Bloc<FetchBannersEvent, FetchBannersState> {
  final Productrepo repository;
  FetchBannersBloc({required this.repository}) : super(FetchBannersInitial()) {
    on<FetchBannersEvent>((event, emit) {
      // TODO: implement event handler
    });
     on<FetchBannersInitialEvent>(bannersfetchingevent);
  }
    FutureOr<void> bannersfetchingevent(FetchBannersInitialEvent event, Emitter<FetchBannersState> emit) async{
    emit(FetchBannersLoadingState());
    try {
          final response = await repository.fetchbanner();
    if (!response.error && response.status == 200) {
      emit(FetchBannersSuccessState(banners: response.data!));
    } else {
      emit(FetchBannersErrorState(message: response.message));
    }
      
    } catch (e) {
       emit(FetchBannersErrorState(message: 'Error fetching banners'));
    }
  }
}
