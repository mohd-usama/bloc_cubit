import 'package:cubit/BlocExp/counter_bloc_events.dart';
import 'package:cubit/BlocExp/counter_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterBlocEvents, CounterBlocState> {
  CounterBloc() : super(CounterBlocState(false,count: 0)) {
    on<IncrementCounter>(incrementCounter);
    on<DecrementCounter>(decrementCounter);
    on<CheckBoxValue>(checkBoxValue);
  }

  void incrementCounter(IncrementCounter event, Emitter<CounterBlocState> emit) {
    emit(CounterBlocState(state.isCheckBox,count: state.count+1));
  }

  void decrementCounter(DecrementCounter event, Emitter<CounterBlocState> emit) {
    emit(CounterBlocState(state.isCheckBox,count: state.count-1));
  }

  void checkBoxValue(CheckBoxValue event, Emitter<CounterBlocState> emit) {
    emit(CounterBlocState(event.isValue,count: state.count));
  }
}
