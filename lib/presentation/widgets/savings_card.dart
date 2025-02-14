import 'package:define_digitals/utils/helpers.dart';
import 'package:flutter/material.dart';

class SavingsCard extends StatelessWidget {
  final String title;
  final double amount;

  const SavingsCard({super.key, required this.title, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              formatCurrency(amount),
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
