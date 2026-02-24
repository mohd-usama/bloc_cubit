

import 'package:equatable/equatable.dart';

class CounterBlocState extends Equatable{

  int count;
  bool isCheckBox=false;
  CounterBlocState(this.isCheckBox,{required this.count});

  @override
  List<Object?> get props => [isCheckBox,count];

}