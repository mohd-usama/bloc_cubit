
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(0));

  void incrementCounter() {
    print(state.count++);
    emit(CounterState(state.count++));
  }

  void decrementCounter() {
    print(state.count--);
    emit(CounterState(state.count--));
  }
}
