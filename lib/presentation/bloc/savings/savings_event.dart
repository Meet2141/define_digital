import '../../../data/models/saving_model.dart';
import '../../../data/models/transaction_model.dart';

abstract class SavingsEvent {}

class AddSavingsEvent extends SavingsEvent {
  final SavingsModel savings;

  AddSavingsEvent(this.savings);
}

class WithdrawEvent extends SavingsEvent {
  final TransactionModel transaction;

  WithdrawEvent(this.transaction);
}
