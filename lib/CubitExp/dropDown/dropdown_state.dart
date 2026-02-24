import 'package:equatable/equatable.dart';

abstract class DropdownState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends DropdownState {}

class LoadingState extends DropdownState {}

class LoadedState extends DropdownState {
  String? selectedItem;
  List<String> dropDownList = [];

  LoadedState({this.selectedItem, required this.dropDownList});

  @override
  List<Object?> get props => [selectedItem, dropDownList];
}

class ErrorState extends DropdownState {
  String error = "";
  @override
  List<Object?> get props => [error];
}
