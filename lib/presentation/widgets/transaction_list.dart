import 'package:define_digitals/data/models/transaction_model.dart';
import 'package:define_digitals/utils/constants.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<TransactionModel> transactions;

  const TransactionList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    final groupedTransactions = <int, Map<String, double>>{};

    for (var transaction in transactions) {
      groupedTransactions.putIfAbsent(transaction.year, () => {'Savings': 0, 'Withdrawn': 0});
      if (transaction.component == Constants.compA || transaction.component == Constants.compB) {
        groupedTransactions[transaction.year]!['Withdrawn'] =
            (groupedTransactions[transaction.year]!['Withdrawn'] ?? 0) + transaction.amount;
      } else {
        groupedTransactions[transaction.year]!['Savings'] =
            (groupedTransactions[transaction.year]!['Savings'] ?? 0) + transaction.amount;
      }
    }

    return ListView.separated(
      shrinkWrap: true,
      itemCount: groupedTransactions.length,
      separatorBuilder: (c, i) => Divider(),
      itemBuilder: (context, index) {
        final year = groupedTransactions.keys.elementAt(index);
        final data = groupedTransactions[year]!;

        return ListTile(
          title: Text(
            '$year',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style.copyWith(fontSize: 14),
              children: [
                TextSpan(
                  text: Constants.savings,
                  style: TextStyle(fontWeight: FontWeight.w600, color: Color.secondary),
                ),
                TextSpan(
                  text: '\$${data['Savings']?.toStringAsFixed(2) ?? '0'}  ',
                  style: TextStyle(fontWeight: FontWeight.w700, color: Color.black),
                ),
                TextSpan(
                  text: Constants.withdrawn,
                  style: TextStyle(fontWeight: FontWeight.w600, color: Color.secondary),
                ),
                TextSpan(
                  text: '\$${data['Withdrawn']?.toStringAsFixed(2) ?? '0'}',
                  style: TextStyle(fontWeight: FontWeight.w700, color: Color.black),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
