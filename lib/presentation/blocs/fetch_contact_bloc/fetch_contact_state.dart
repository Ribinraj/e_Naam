part of 'fetch_contact_bloc.dart';

@immutable
sealed class FetchContactState {}

final class FetchContactInitial extends FetchContactState {}

final class FetchContactLoadingState extends FetchContactState {}

final class FetchcontactSuccessState extends FetchContactState {
  final ContactInfoModel contact;

  FetchcontactSuccessState({required this.contact});
}

final class FetchContactErrorState extends FetchContactState {
  final String message;

  FetchContactErrorState({required this.message});
}
