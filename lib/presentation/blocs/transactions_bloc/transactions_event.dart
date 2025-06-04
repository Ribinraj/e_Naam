part of 'transactions_bloc.dart';

@immutable
sealed class TransactionsEvent {}
final class FetchTransactionsInitialEvent extends TransactionsEvent{}