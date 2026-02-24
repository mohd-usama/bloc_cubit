import 'dart:async';

import 'package:cubit/BlocExp/Bottombar/pages/Second/second_event.dart';
import 'package:cubit/BlocExp/Bottombar/pages/Second/second_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondBloc extends Bloc<SecondEvent, SecondState> {
  SecondBloc() : super(SecondState()) {
    on<TabBarChange>(_tabBarChange);
  }

  FutureOr<void> _tabBarChange(TabBarChange event, Emitter<SecondState> emit) {
    emit(SecondState(currentIndex: state.currentIndex));
  }
}
