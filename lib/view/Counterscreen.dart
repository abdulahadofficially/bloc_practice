// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/bloc/counterbloc/counter_bloc.dart';
import 'package:project/bloc/counterbloc/counter_event.dart';
import 'package:project/bloc/counterbloc/counter_state.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
              return Text(state.counter.toString());
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(IncreamentCounter());
                    },
                    child: const Text('Increament')),
                ElevatedButton(
                    onPressed: () {}, child: const Text('Decreament'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
