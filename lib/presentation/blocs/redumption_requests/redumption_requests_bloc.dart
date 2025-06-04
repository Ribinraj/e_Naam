import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_naam/data/redumptionrequests_model.dart';
import 'package:e_naam/domain/repositories/productrepo.dart';
import 'package:meta/meta.dart';

part 'redumption_requests_event.dart';
part 'redumption_requests_state.dart';

class RedumptionRequestsBloc
    extends Bloc<RedumptionRequestsEvent, RedumptionRequestsState> {
  final Productrepo repository;
  RedumptionRequestsBloc({required this.repository}) : super(RedumptionRequestsInitial()) {
    on<RedumptionRequestsEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<RedumptionRequestsFetchingInitialEvent>(redumptionrequest);
  }

  FutureOr<void> redumptionrequest(RedumptionRequestsFetchingInitialEvent event,
      Emitter<RedumptionRequestsState> emit) async {
    emit(RedumptionRequestsLoadingState());
    try {
      final response = await repository.fetchredeemrequests();
      if (!response.error && response.status == 200) {
        emit(
            RedumptionRequestsSuccessState(redumptionrequests: response.data!));
      } else {
        emit(RedumptionsRequestsErrorState(message: response.message));
      }
    } catch (e) {
          emit(RedumptionsRequestsErrorState(message:e.toString()));
    }
  }
}
