part of 'qr_code_bloc.dart';

@immutable
sealed class QrCodeEvent {}

final class QrCodeuploadingEvent extends QrCodeEvent {
  final String code;

  QrCodeuploadingEvent({required this.code});
}
