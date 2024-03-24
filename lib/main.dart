import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/view/Homeview/bloc/signin_bloc.dart';

import 'view/Homeview/homeview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SiginBloc(),
      child: MaterialApp(
        title: 'Bloc Statemanagement Practice',
        home: HomeScreen(),
      ),
    );
  }
}
