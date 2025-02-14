import 'package:hive/hive.dart';

class SavingsModel extends HiveObject {
  @HiveField(0)
  double compA;
  @HiveField(1)
  double compB;
  @HiveField(2)
  int year;

  SavingsModel({required this.compA, required this.compB, required this.year});
}
