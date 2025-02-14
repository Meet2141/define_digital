import 'package:define_digitals/data/models/saving_model.dart';
import 'package:define_digitals/presentation/bloc/savings/savings_bloc.dart';
import 'package:define_digitals/presentation/bloc/savings/savings_event.dart';
import 'package:define_digitals/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavingsScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  SavingsScreen({super.key});

  void _handleSave(BuildContext context) {
    if (controller.text.isNotEmpty) {
      final amount = double.parse(controller.text);
      context.read<SavingsBloc>().add(
            AddSavingsEvent(SavingsModel(
              compA: amount / 2,
              compB: amount / 2,
              year: DateTime.now().year,
            )),
          );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(Constants.pleaseEnterAnAmount),
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
        title: Text(Constants.addSaving),
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
              onPressed: () => _handleSave(context),
              child: Text(Constants.save),
            ),
          ],
        ),
      ),
    );
  }
}
