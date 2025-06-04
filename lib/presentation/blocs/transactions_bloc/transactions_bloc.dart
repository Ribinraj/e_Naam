import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_naam/data/transactions_model.dart';
import 'package:e_naam/domain/repositories/productrepo.dart';
import 'package:meta/meta.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  final Productrepo repository;
  TransactionsBloc({required this.repository}) : super(TransactionsInitial()) {
    on<TransactionsEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<FetchTransactionsInitialEvent>(fetchtransaction);
  }

  FutureOr<void> fetchtransaction(FetchTransactionsInitialEvent event,
      Emitter<TransactionsState> emit) async {
    emit(FetchTransactionsLoadingState());
    try {
      final response = await repository.fetchtransactions();
      if (!response.error && response.status == 200) {
        emit(FetchTransactionsSuccessState(transactions: response.data!));
      } else {
        emit(FetchtransactionsErrorState(message: response.message));
      }
    } catch (e) {
         emit(FetchtransactionsErrorState(message:e.toString()));
    }
  }
}
