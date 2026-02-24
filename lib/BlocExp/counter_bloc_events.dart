import 'package:equatable/equatable.dart';

abstract class CounterBlocEvents extends Equatable {
  CounterBlocEvents();
  @override
  List<Object?> get props => [];
}

class IncrementCounter extends CounterBlocEvents {}

class DecrementCounter extends CounterBlocEvents {}

class CheckBoxValue extends CounterBlocEvents {
  bool isValue;
  CheckBoxValue(this.isValue);

  @override
  List<Object> get props => [isValue];

}
