import 'package:define_digitals/data/models/transaction_model.dart';
import 'package:define_digitals/presentation/bloc/savings/savings_bloc.dart';
import 'package:define_digitals/presentation/bloc/savings/savings_event.dart';
import 'package:define_digitals/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WithdrawScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  WithdrawScreen({super.key});

  void _handleWithdraw(BuildContext context, String component) {
    if (controller.text.isNotEmpty) {
      final amount = double.parse(controller.text);
      final transaction = TransactionModel(
        amount: amount,
        component: component,
        year: DateTime.now().year,
      );
      context.read<SavingsBloc>().add(WithdrawEvent(transaction));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(Constants.pleaseEnterAnAmountToWithdraw),
          backgroundColor: Color.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.primary,
        title: Text(Constants.withdrawSavings),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\+?\d*'))],
              decoration: InputDecoration(labelText: Constants.enterAmount),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => _handleWithdraw(context, Constants.compA),
              child: Text(Constants.withdrawFromCompA),
            ),
            ElevatedButton(
              onPressed: () => _handleWithdraw(context, Constants.compB),
              child: Text(Constants.withdrawFromCompB),
            ),
          ],
        ),
      ),
    );
  }
}
