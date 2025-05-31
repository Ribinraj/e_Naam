part of 'fetch_banners_bloc.dart';

@immutable
sealed class FetchBannersEvent {}
final class FetchBannersInitialEvent extends FetchBannersEvent{}