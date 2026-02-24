import 'package:equatable/equatable.dart';

import 'Model/list_model.dart';

abstract class ListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends ListState {}

class LoadingState extends ListState {}

class LoadedState extends ListState {
  List<ListModel> userList = [];
  LoadedState(this.userList);

  @override
  List<Object?> get props => [userList];
}

class ErrorState extends ListState {
  String errorMsg = "";

  ErrorState(this.errorMsg);
  @override
  List<Object?> get props => [errorMsg];
}
