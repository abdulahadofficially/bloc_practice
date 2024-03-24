import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState {
  initialstate,
  loststate,
  gainedState,
}

class InternetCubit extends Cubit<InternetState> {
  Connectivity? _connectivity;
  StreamSubscription? connectivitySubscription;
  InternetCubit() : super(InternetState.initialstate) {
    connectivitySubscription =
        _connectivity!.onConnectivityChanged.listen((result) {
      // ignore: unrelated_type_equality_checks
      if (result == ConnectivityResult.mobile ||
          // ignore: unrelated_type_equality_checks
          result == ConnectivityResult.wifi) {
        emit(InternetState.gainedState);
      } else {
        emit(InternetState.loststate);
      }
    });
  }

  @override
  Future<void> close() {
    connectivitySubscription!.cancel();
    return super.close();
  }
}
