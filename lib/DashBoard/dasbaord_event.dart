import 'package:cubit/Model/LoginModel.dart';
import 'package:equatable/equatable.dart';

abstract class DasbaordEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginModelLoad extends DasbaordEvent {

}

class StatusListLoad extends DasbaordEvent{

}