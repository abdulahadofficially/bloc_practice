import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/cubit/cubit/internetcubit_cubit.dart';
import 'package:project/view/Counterscreen.dart';
import 'package:project/view/internet_Connectivity_through_cubit.dart';
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
        // BlocProvider(
        //   create: (context) => CounterBloc(),
        // ),
        // BlocProvider(
        //   create: (context) => InternetBloc(),
        // ),
        BlocProvider(
          create: (context) => InternetCubit(),
        ),
      ],
      child: const MaterialApp(
        title: 'Bloc Statemanagement Practice',
        home: InternetConnectivityCubit(),
      ),
    );
  }
}
