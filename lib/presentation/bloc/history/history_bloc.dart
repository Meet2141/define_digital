import 'package:define_digitals/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/savings_repository.dart';
import 'history_event.dart';
import 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final SavingsRepository repository;

  HistoryBloc(this.repository) : super(HistoryInitial()) {
    on<LoadHistoryEvent>(_onLoadHistory);
  }

  void _onLoadHistory(LoadHistoryEvent event, Emitter<HistoryState> emit) async {
    emit(HistoryLoading());
    try {
      final transactions = repository.getAllTransactions();
      emit(HistoryLoaded(transactions));
    } catch (e) {
      emit(HistoryError(Constants.failedToLoadHistory));
    }
  }
}
