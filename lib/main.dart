import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'core/adapter/saving_adapter.dart';
import 'core/adapter/transaction_adapter.dart';
import 'data/models/saving_model.dart';
import 'data/models/transaction_model.dart';
import 'data/repositories/savings_repository.dart';
import 'presentation/bloc/history/history_bloc.dart';
import 'presentation/bloc/savings/savings_bloc.dart';
import 'presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(SavingsModelAdapter());
  Hive.registerAdapter(TransactionModelAdapter());
  await Hive.openBox<SavingsModel>('savingsBox');
  await Hive.openBox<TransactionModel>('transactionsBox');
  runApp(MyApp());
}

// App Structure
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SavingsBloc(SavingsRepository())),
        BlocProvider(create: (_) => HistoryBloc(SavingsRepository())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
