part of 'fetch_categories_bloc.dart';

@immutable
sealed class FetchCategoriesEvent {}
final class FetchCategoriesInitialeEvent extends FetchCategoriesEvent{}