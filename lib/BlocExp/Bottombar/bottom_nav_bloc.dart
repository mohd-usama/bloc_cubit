import 'dart:async';

import 'package:cubit/BlocExp/Bottombar/bottom_nav_event.dart';
import 'package:cubit/BlocExp/Bottombar/bottom_nav_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavState()) {
    on<BottomNavChange>(_bottomNavChange);
  }

  void _bottomNavChange(BottomNavChange event, Emitter<BottomNavState> emit) {
    emit(BottomNavState(currentIndex: event.index));
  }
}
