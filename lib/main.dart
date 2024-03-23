import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/bloc/counterbloc/counter_bloc.dart';
import 'package:project/bloc/internetbloc/internetbloc.dart';
import 'package:project/view/Counterscreen.dart';
import 'package:project/view/internet_connectivity_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => InternetBloc(),
        )
      ],
      child: const MaterialApp(
        title: 'Bloc Statemanagement Practice',
        home: InternetConnectivityScreen(),
      ),
    );
  }
}
