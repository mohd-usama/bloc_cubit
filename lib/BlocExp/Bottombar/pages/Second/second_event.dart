import 'package:equatable/equatable.dart';

abstract class SecondEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TabBarChange extends SecondEvent {
  final int tabbarIndex;
  TabBarChange(this.tabbarIndex);

  @override
  List<Object?> get props => [tabbarIndex];
}
