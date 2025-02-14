import 'package:hive/hive.dart';

class TransactionModel extends HiveObject {
  @HiveField(0)
  double amount;
  @HiveField(1)
  String component;
  @HiveField(2)
  int year;

  TransactionModel({required this.amount, required this.component, required this.year});
}
