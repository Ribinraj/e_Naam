part of 'fetch_latest_product_bloc.dart';

@immutable
sealed class FetchLatestProductState {}

final class FetchLatestProductInitial extends FetchLatestProductState {}

final class FetchLatestProductsLoadingState extends FetchLatestProductState {}

final class FetchLatestProductSuccessState extends FetchLatestProductState {
  final List<ProductModel> latestproducts;

  FetchLatestProductSuccessState({required this.latestproducts});
}

final class FetchLatestProductsErrorState extends FetchLatestProductState {
  final String message;

  FetchLatestProductsErrorState({required this.message});
}
