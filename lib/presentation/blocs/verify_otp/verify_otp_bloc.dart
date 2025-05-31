import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_naam/data/verify_otpmodel.dart';
import 'package:e_naam/domain/repositories/loginrepo.dart';
import 'package:meta/meta.dart';

part 'verify_otp_event.dart';
part 'verify_otp_state.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  final Loginrepo repository;
  VerifyOtpBloc({required this.repository}) : super(VerifyOtpInitial()) {
    on<VerifyOtpEvent>((event, emit) {
      // TODO: implement event handler
    });
       on<VerifyOtpButtonclickEvent>(verifyOtp);
  }
    FutureOr<void> verifyOtp(VerifyOtpButtonclickEvent event, Emitter<VerifyOtpState> emit) async{
    emit(VerifyOtpLoadingState());
    try {
      final response=await repository.verifyotp(
       user: event.user
      );
      if (!response.error && response.status == 200) {
        emit(VerifyOtpSuccessState());
      } else {
        emit(VerifyOtpErrorState(message: response.message));
        
      }

    } catch (e) {
      emit(VerifyOtpErrorState(message: e.toString()));
    }
  }
}
