import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/bloc/internetbloc/internetbloc.dart';
import 'package:project/bloc/internetbloc/internetstate.dart';

class InternetConnectivityScreen extends StatelessWidget {
  const InternetConnectivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<InternetBloc, InternetState>(
          listener: (context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Conntect')));
            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Not Conntect')));
            }
          },
          builder: (context, state) {
            return BlocBuilder<InternetBloc, InternetState>(
              builder: (context, state) {
                if (state is InternetGainedState) {
                  return const Text('Connected');
                } else if (state is InternetLostState) {
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
