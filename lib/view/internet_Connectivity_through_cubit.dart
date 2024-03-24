import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/cubit/cubit/internetcubit_cubit.dart';

class InternetConnectivityCubit extends StatelessWidget {
  const InternetConnectivityCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<InternetCubit, InternetState>(
          listener: (context, state) {
            if (state == InternetState.gainedState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Conntect')));
            } else if (state == InternetState.loststate) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Not Conntect')));
            }
          },
          builder: (context, state) {
            return BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state == InternetState.gainedState) {
                  return const Text('Connected');
                } else if (state == InternetState.loststate) {
                  return const Text('No Connected');
                } else {
                  return const Text('Loading....');
                }
              },
            );
          },
        ),
      ),
    );
  }
}
