import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_naam/data/update_profilemodel.dart';
import 'package:e_naam/domain/repositories/loginrepo.dart';
import 'package:meta/meta.dart';

part 'update_profile_event.dart';
part 'update_profile_state.dart';

class UpdateProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  final Loginrepo repository;
  UpdateProfileBloc({required this.repository}) : super(UpdateProfileInitial()) {
    on<UpdateProfileEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<UpdateProfileButtonclickEvent>(updateprofile);
  }

  FutureOr<void> updateprofile(UpdateProfileButtonclickEvent event, Emitter<UpdateProfileState> emit) async{
        emit(UpdateProfileLoadingState());
    try {
      final response = await repository.updateprofile(profile: event.profile);
          if (!response.error && response.status == 200) {
        emit(UpdateProfileSuccessState(message: response.message));
            
          }else{
            emit(UpdateProfileErrorState(message: response.message));
          }
    } catch (e) {
      emit(UpdateProfileErrorState(message: e.toString()));
      print(e.toString());
    }
  }
}
