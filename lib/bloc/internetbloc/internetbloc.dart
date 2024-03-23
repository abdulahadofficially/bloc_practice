import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/bloc/internetbloc/internetevent.dart';
import 'package:project/bloc/internetbloc/internetstate.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  Connectivity connectivity = Connectivity();
  StreamSubscription? connectivitySupscription;
  InternetBloc() : super(InternetInitilieState()) {
    on<InternetLostEvent>(internetLost);
    on<InternetGainedEvent>(internetGained);

    connectivitySupscription =
        connectivity.onConnectivityChanged.listen((result) {
      // ignore: unrelated_type_equality_checks
      if (result == ConnectivityResult.mobile ||
          // ignore: unrelated_type_equality_checks
          result == ConnectivityResult.wifi ||
          // ignore: unrelated_type_equality_checks
          result == ConnectivityResult.ethernet) {
        add(InternetGainedEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }

  void internetLost(InternetEvent event, Emitter emit) {
    return emit(InternetLostState());
  }

  void internetGained(InternetEvent event, Emitter emit) {
    return emit(InternetGainedState());
  }

  @override
  Future<void> close() {
    connectivitySupscription!.cancel();
    return super.close();
  }
}
