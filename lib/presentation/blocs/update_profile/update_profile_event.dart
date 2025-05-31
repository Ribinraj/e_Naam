part of 'update_profile_bloc.dart';

@immutable
sealed class UpdateProfileEvent {}

final class UpdateProfileButtonclickEvent extends UpdateProfileEvent {
  final UpdateProfilemodel profile;

  UpdateProfileButtonclickEvent({required this.profile});
}
