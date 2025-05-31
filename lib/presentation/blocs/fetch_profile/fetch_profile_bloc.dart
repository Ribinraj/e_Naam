import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_naam/data/profile_model.dart';
import 'package:e_naam/domain/repositories/loginrepo.dart';
import 'package:meta/meta.dart';

part 'fetch_profile_event.dart';
part 'fetch_profile_state.dart';

class FetchProfileBloc extends Bloc<FetchProfileEvent, FetchProfileState> {
  final Loginrepo repository;
  FetchProfileBloc({required this.repository}) : super(FetchProfileInitial()) {
    on<FetchProfileEvent>((event, emit) {
      // TODO: implement event handler
    });
     on<FetchProfileInitialEvent>(profilefetching);
  }

  FutureOr<void> profilefetching(FetchProfileInitialEvent event, Emitter<FetchProfileState> emit)async {
        emit(FetchProfileLoadingState());
    try {
      print("Before API call");
      final response = await repository.fetchprofile();
      print(
          "After API call - Response received: status=${response.status}, error=${response.error}");
      if (!response.error && response.status == 200) {
        print('Data received: ${response.status}');
        emit(FetchProfileSuccessState(profile: response.data!));
      } else {
        emit(FetchProfileErrorState(message: response.message));
      }
    } catch (e) {
      emit(FetchProfileErrorState(message: e.toString()));
    }
  }
}
