import 'package:flutter/material.dart';
import 'package:project/equatable_package_testing/equatable_package.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Bloc Statemanagement Practice',
      home: EqutableTesting(),
    );
  }
}
