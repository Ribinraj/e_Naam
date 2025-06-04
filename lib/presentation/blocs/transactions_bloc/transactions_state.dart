part of 'transactions_bloc.dart';

@immutable
sealed class TransactionsState {}

final class TransactionsInitial extends TransactionsState {}

final class FetchTransactionsLoadingState extends TransactionsState {}

final class FetchTransactionsSuccessState extends TransactionsState {
  final List<TransactionsModel> transactions;

  FetchTransactionsSuccessState({required this.transactions});
}

final class FetchtransactionsErrorState extends TransactionsState {
  final String message;

  FetchtransactionsErrorState({required this.message});
}
