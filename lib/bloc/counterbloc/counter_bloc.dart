import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/bloc/counterbloc/counter_event.dart';
import 'package:project/bloc/counterbloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncreamentCounter>((event, emit) => increament);
    on<DecreamentCounter>((event, emit) => decreament);
  }

  void increament(IncreamentCounter event, Emitter<CounterState> emit) async {
    debugPrint('enter');
    emit(state.copyWith(counter: state.counter! + 1));
    debugPrint('this is your increament: ${state.counter.toString()}');
  }

  void decreament(DecreamentCounter event, Emitter<CounterState> emit) async {
    emit(state.copyWith(counter: state.counter! - 1));
  }
}
