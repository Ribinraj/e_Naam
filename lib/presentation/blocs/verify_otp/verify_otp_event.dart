part of 'verify_otp_bloc.dart';

@immutable
sealed class VerifyOtpEvent {}

final class VerifyOtpButtonclickEvent extends VerifyOtpEvent {
  final VerifyOtpmodel user;

  VerifyOtpButtonclickEvent({required this.user});
}
