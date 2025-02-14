import 'package:hive/hive.dart';

import '../models/saving_model.dart';
import '../models/transaction_model.dart';

class SavingsRepository {
  final Box<SavingsModel> savingsBox = Hive.box<SavingsModel>('savingsBox');
  final Box<TransactionModel> transactionsBox = Hive.box<TransactionModel>('transactionsBox');

  Future<void> addSavings(SavingsModel savings) async {
    await savingsBox.add(savings);
  }

  List<SavingsModel> getAllSavings() {
    return savingsBox.values.toList();
  }

  Future<void> withdraw(TransactionModel transaction) async {
    if (savingsBox.isNotEmpty) {
      SavingsModel latestSavings = savingsBox.getAt(savingsBox.length - 1)!;

      if (transaction.component == "CompA") {
        latestSavings.compA -= transaction.amount;
      } else if (transaction.component == "CompB") {
        latestSavings.compB -= transaction.amount;
      }

      await latestSavings.save(); // Save updated savings entry
    }

    await transactionsBox.add(transaction); // Still store the transaction history
  }

  List<TransactionModel> getAllTransactions() {
    return transactionsBox.values.toList();
  }
}
