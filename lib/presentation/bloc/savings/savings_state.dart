import '../../../data/models/saving_model.dart';

abstract class SavingsState {}

class SavingsInitial extends SavingsState {}

class SavingsLoading extends SavingsState {}

class SavingsLoaded extends SavingsState {
  final List<SavingsModel> savings;
  SavingsLoaded(this.savings);
}

class SavingsError extends SavingsState {
  final String message;
  SavingsError(this.message);
}
