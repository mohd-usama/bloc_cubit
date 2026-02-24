import 'package:equatable/equatable.dart';

abstract class FormEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadDropdownEvent extends FormEvent {}

class DropdownChanged extends FormEvent {
  final String value;
  DropdownChanged(this.value);
}

class CheckboxChanged extends FormEvent {
  final bool value;
  CheckboxChanged(this.value);
}

class SliderChanged extends FormEvent {
  final double value;
  SliderChanged(this.value);
}

class RadioChanged extends FormEvent {
  final String value;
  RadioChanged(this.value);
}

class UserNameChange extends FormEvent {
  final String userName;
  UserNameChange(this.userName);
}

class PasswordChange extends FormEvent {
  final String password;
  PasswordChange(this.password);
}

class LoginButtonPress extends FormEvent {}

