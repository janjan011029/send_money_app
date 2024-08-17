import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_money_app/bloc_observer.dart';
import 'package:send_money_app/my_app.dart';

void main() {
  Bloc.observer = const AppBlocObserver();
  runApp(const MyApp());
}
