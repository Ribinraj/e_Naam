import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_naam/data/redeem_requestmodel.dart';
import 'package:e_naam/domain/repositories/productrepo.dart';
import 'package:meta/meta.dart';

part 'redeem_request_event.dart';
part 'redeem_request_state.dart';

class RedeemRequestBloc extends Bloc<RedeemRequestEvent, RedeemRequestState> {
  final Productrepo repository;
  RedeemRequestBloc({required this.repository})
      : super(RedeemRequestInitial()) {
    on<RedeemRequestEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<RedeeRequestButtonClickEvent>(request);
  }

  FutureOr<void> request(RedeeRequestButtonClickEvent event,
      Emitter<RedeemRequestState> emit) async {
    emit(RedeemRequestLoadingState());
    try {
      final response =
          await repository.redeemrequest(redeemdata: event.request);
      if (!response.error && response.status == 200) {
        emit(RedeemRequestSuccessState(message: response.message));
      } else {
        emit(RedeemRequestErrorState(message: response.message));
      }
    } catch (e) {
      emit(RedeemRequestErrorState(message:e.toString()));
    }
  }
}
