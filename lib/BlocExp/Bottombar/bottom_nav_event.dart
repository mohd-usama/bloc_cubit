import 'package:equatable/equatable.dart';

abstract class BottomNavEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class BottomNavChange extends BottomNavEvent {
  final int index;
  BottomNavChange(this.index);
  @override
  List<Object> get props => [index];
}
