import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();
  @override
  List<Object?> get props => throw UnimplementedError();
}

class IncreamentCounter extends CounterEvent {}
class DecreamentCounter extends CounterEvent {}
