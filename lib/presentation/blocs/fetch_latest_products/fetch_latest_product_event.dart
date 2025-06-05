part of 'fetch_latest_product_bloc.dart';

@immutable
sealed class FetchLatestProductEvent {}
final class FetchLatestProductInitialEvent extends FetchLatestProductEvent{}