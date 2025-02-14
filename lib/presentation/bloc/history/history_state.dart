import '../../../data/models/transaction_model.dart';

abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistoryLoaded extends HistoryState {
  final List<TransactionModel> transactions;

  HistoryLoaded(this.transactions);
}

class HistoryError extends HistoryState {
  final String message;

  HistoryError(this.message);
}
