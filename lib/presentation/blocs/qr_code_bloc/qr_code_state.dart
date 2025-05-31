part of 'qr_code_bloc.dart';

@immutable
sealed class QrCodeState {}

final class QrCodeInitial extends QrCodeState {}

final class QrCodeLoadingState extends QrCodeState {}

final class QrCodeSuccessState extends QrCodeState {
  final String message;

  QrCodeSuccessState({required this.message});
}

final class QrCodeErrorState extends QrCodeState {
  final String message;

  QrCodeErrorState({required this.message});
}
