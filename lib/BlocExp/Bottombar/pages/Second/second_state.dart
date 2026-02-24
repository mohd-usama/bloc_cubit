import 'package:equatable/equatable.dart';

class SecondState extends Equatable {
  final int currentIndex;

  SecondState({this.currentIndex = 0});

  @override
  List<Object?> get props => [currentIndex];
}
