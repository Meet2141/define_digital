import 'package:define_digitals/presentation/bloc/history/history_event.dart';
import 'package:define_digitals/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/history/history_bloc.dart';
import '../../bloc/history/history_state.dart';
import '../../widgets/transaction_list.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HistoryBloc>().add(LoadHistoryEvent());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.primary,
        title: Text(Constants.transactionHistory),
      ),
      body: BlocBuilder<HistoryBloc, HistoryState>(
        builder: (context, state) {
          if (state is HistoryInitial) {
            return Center(child: CircularProgressIndicator());
          } else if (state is HistoryLoaded) {
            return state.transactions.isEmpty
                ? Center(child: Text(Constants.noTransactionYet))
                : TransactionList(transactions: state.transactions);
          } else {
            return Center(child: Text(Constants.failedToLoadHistory));
          }
        },
      ),
    );
  }
}
