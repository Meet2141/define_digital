import 'package:define_digitals/data/models/saving_model.dart';
import 'package:define_digitals/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/savings_repository.dart';
import 'savings_event.dart';
import 'savings_state.dart';

class SavingsBloc extends Bloc<SavingsEvent, SavingsState> {
  final SavingsRepository repository;

  SavingsBloc(this.repository) : super(SavingsLoading()) {
    _loadInitialSavings();
    on<AddSavingsEvent>(_onAddSavings);
    on<WithdrawEvent>(_onWithdraw);
  }

  void _loadInitialSavings() {
    final savings = repository.getAllSavings();
    emit(SavingsLoaded(List<SavingsModel>.from(savings)));
  }

  Future<void> _onAddSavings(AddSavingsEvent event, Emitter<SavingsState> emit) async {
    emit(SavingsLoading());
    try {
      await repository.addSavings(event.savings);
      final updatedSavings = List<SavingsModel>.from(repository.getAllSavings());
      emit(SavingsLoaded(updatedSavings));
    } catch (e) {
      emit(SavingsError(Constants.failedToAddSavings));
    }
  }

  Future<void> _onWithdraw(WithdrawEvent event, Emitter<SavingsState> emit) async {
    if (state is SavingsLoaded) {
      await repository.withdraw(event.transaction);
      final updatedSavings = repository.getAllSavings();
      emit(SavingsLoaded(updatedSavings));
    }
  }
}
