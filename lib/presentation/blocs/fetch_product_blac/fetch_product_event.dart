part of 'fetch_product_bloc.dart';

@immutable
sealed class FetchProductEvent {}

final class FetchProductButtonClickEvent extends FetchProductEvent {
  final String categoryId;

  FetchProductButtonClickEvent({required this.categoryId});
}
