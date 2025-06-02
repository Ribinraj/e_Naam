part of 'fetch_product_bloc.dart';

@immutable
sealed class FetchProductState {}

final class FetchProductInitial extends FetchProductState {}

final class FetchProductLoadingState extends FetchProductState {}

final class FethchProductSuccessState extends FetchProductState {
  final List<ProductModel> products;

  FethchProductSuccessState({required this.products});
}

final class FetchProductErrorState extends FetchProductState {
  final String message;

  FetchProductErrorState({required this.message});
}
