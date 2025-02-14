import 'package:define_digitals/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/savings/savings_bloc.dart';
import '../../bloc/savings/savings_state.dart';
import '../../widgets/savings_card.dart';
import '../history/history_screen.dart';
import '../saving/saving_screen.dart';
import '../withdraw/withdrawal_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.primary,
        title: Text(
          Constants.appTitle,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            BlocBuilder<SavingsBloc, SavingsState>(
              builder: (context, state) {
                if (state is SavingsLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is SavingsLoaded) {
                  double totalCompA = state.savings.fold(0.0, (sum, saving) => sum + saving.compA);
                  double totalCompB = state.savings.fold(0.0, (sum, saving) => sum + saving.compB);

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SavingsCard(title: Constants.compA, amount: totalCompA),
                      SavingsCard(title: Constants.compB, amount: totalCompB),
                    ],
                  );
                } else {
                  return Center(
                    child: Text(
                      Constants.noSavingFound,
                    ),
                  );
                }
              },
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SavingsScreen())),
              child: Text(Constants.addSaving),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => WithdrawScreen())),
              child: Text(Constants.withdraw),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryScreen())),
              child: Text(Constants.viewHistory),
            ),
          ],
        ),
      ),
    );
  }
}
