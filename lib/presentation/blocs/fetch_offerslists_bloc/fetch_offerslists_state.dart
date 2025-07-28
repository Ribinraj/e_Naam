part of 'fetch_offerslists_bloc.dart';

@immutable
sealed class FetchOfferslistsState {}

final class FetchOfferslistsInitial extends FetchOfferslistsState {}

final class FetchoffersLoadingState extends FetchOfferslistsState {}

final class FetchoffersSuccessState extends FetchOfferslistsState {
  final List<OfferModel> offers;

  FetchoffersSuccessState({required this.offers});
}

final class FetchOffersErrorState extends FetchOfferslistsState {
  final String message;

  FetchOffersErrorState({required this.message});
}
