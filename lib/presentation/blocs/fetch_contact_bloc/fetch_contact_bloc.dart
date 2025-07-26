import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_naam/data/contact_model.dart';
import 'package:e_naam/domain/repositories/productrepo.dart';
import 'package:meta/meta.dart';

part 'fetch_contact_event.dart';
part 'fetch_contact_state.dart';

class FetchContactBloc extends Bloc<FetchContactEvent, FetchContactState> {
  final Productrepo repository;
  FetchContactBloc({required this.repository}) : super(FetchContactInitial()) {
    on<FetchContactEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<FetchcontactInitailEvent>(fetchcontact);
  }

  FutureOr<void> fetchcontact(
      FetchcontactInitailEvent event, Emitter<FetchContactState> emit) async {
    emit(FetchContactLoadingState());
    try {
      final response = await repository.fetchcontact();
      if (!response.error && response.status == 200) {
        emit(FetchcontactSuccessState(contact: response.data!));
      } else {
        emit(FetchContactErrorState(message: response.message));
      }
    } catch (e) {
       emit(FetchContactErrorState(message: e.toString()));
    }
  }
}
