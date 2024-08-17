import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_money_app/api/client.dart';
import 'package:send_money_app/features/history/domain/repositories/history_repository.dart';
import 'package:send_money_app/features/history/presentation/bloc/history_bloc.dart';
import 'package:send_money_app/features/savings/presentation/cubit/savings_cubit.dart';
import 'package:send_money_app/router/route.dart';
final _myRouter = MyRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dioClient = DioClient();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HistoryBloc(HistoryRepository(
            dioClient: dioClient,
          )),
        ),
        BlocProvider(
          create: (context) => SavingsCubit(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _myRouter.routes,
      ),
    );
  }
}
