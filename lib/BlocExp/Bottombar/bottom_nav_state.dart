import 'package:equatable/equatable.dart';

class BottomNavState extends Equatable {
  final int currentIndex;
  BottomNavState({this.currentIndex=0});

  @override
  List<Object?> get props => [currentIndex];
}
