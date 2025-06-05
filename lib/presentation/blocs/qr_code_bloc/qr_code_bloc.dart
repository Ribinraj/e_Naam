import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_naam/domain/repositories/loginrepo.dart';
import 'package:meta/meta.dart';

part 'qr_code_event.dart';
part 'qr_code_state.dart';

class QrCodeBloc extends Bloc<QrCodeEvent, QrCodeState> {
  final Loginrepo repository;
  QrCodeBloc({required this.repository}) : super(QrCodeInitial()) {
    on<QrCodeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<QrCodeuploadingEvent>(qrcode);
  }

  FutureOr<void> qrcode(
      QrCodeuploadingEvent event, Emitter<QrCodeState> emit) async {
    emit(QrCodeLoadingState());
    try {
      final response = await repository.qrcodeScanner(code: event.code);
      if (!response.error && response.status == 200) {
        log('qr ocde sussesssssssssssssssssssssssss');
        emit(QrCodeSuccessState(message: response.message));
      } else {
        log('qr ocde errorrrrrrrrrrrrrrrrrrrr');
        emit(QrCodeErrorState(message: response.message));
      }
    } catch (e) {
      emit(QrCodeErrorState(message: e.toString()));
    }
  }
}
