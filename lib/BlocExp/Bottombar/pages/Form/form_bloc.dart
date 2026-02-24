import 'dart:async';
import 'dart:convert';
import 'package:cubit/ConstApi/const_api.dart';
import 'package:cubit/DashBoard/dashbaord_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Support/PreferenceManager.dart';
import 'form_event.dart';
import 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FormStateClass> {
  FormBloc() : super(const FormStateClass()) {
    on<LoadDropdownEvent>(_loadDropdown);
    on<DropdownChanged>(_onDropdownChanged);
    on<CheckboxChanged>(_onCheckboxChanged);
    on<SliderChanged>(_onSliderChanged);
    on<RadioChanged>(_onRadioChanged);
    on<UserNameChange>(_userNameChange);
    on<PasswordChange>(_passwordChange);
    on<LoginButtonPress>(_loginButtonPress);
  }

  Future<void> _loadDropdown(LoadDropdownEvent event, Emitter<FormStateClass> emit) async {
    emit(state.copyWith(isLoading: true));

    try {
      await Future.delayed(const Duration(seconds: 1));
      final items = ['One', 'Two', 'Three'];

      emit(state.copyWith(
        isLoading: false,
        dropdownItems: items,
        selectedItem: items.first,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: 'Failed to load dropdown',
      ));
    }
  }

  void _onDropdownChanged(DropdownChanged event, Emitter<FormStateClass> emit) {
    emit(state.copyWith(selectedItem: event.value));
  }

  void _onCheckboxChanged(CheckboxChanged event, Emitter<FormStateClass> emit) {
    emit(state.copyWith(isChecked: event.value));
  }

  void _onSliderChanged(SliderChanged event, Emitter<FormStateClass> emit) {
    emit(state.copyWith(sliderValue: event.value));
  }

  void _onRadioChanged(RadioChanged event, Emitter<FormStateClass> emit) {
    emit(state.copyWith(selectedRadio: event.value));
  }

  FutureOr<void> _userNameChange(UserNameChange event, Emitter<FormStateClass> emit) {
    emit(state.copyWith(userName: event.userName));
  }

  FutureOr<void> _passwordChange(PasswordChange event, Emitter<FormStateClass> emit) {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _loginButtonPress(LoginButtonPress event, Emitter<FormStateClass> emit) async {
    if (state.userName.isEmpty) {
      emit(state.copyWith(error: "Please Enter User Code"));
      return;
    }
    if (state.password.isEmpty) {
      emit(state.copyWith(error: "Please Enter Password"));
      return;
    }
    emit(state.copyWith(error: null, isLoading: true));

    Map map = {
      "Token": "SIPL25XTYNDUECMSMEVDEMO0926",
      "UserCode": state.userName.trim(),
      "Password": state.password.trim(),
    };

    try {
      var v = await ConstApi().getHitAPI(map, "https://beta59.sagarinfotech.com/CMS_MEDemoApi/api/Android/Login");
      if (v != null) {
        await PreferenceManager.instance.setString("LoginDetails", jsonEncode(v));
        emit(state.copyWith(
          isLoading: false,
          success: "Success",
          error: null,
          userName: "",
          password: ""
        ));
      } else {
        emit(state.copyWith(error: v["Message"]));
      }
    } catch (cc) {
      emit(state.copyWith(error: cc.toString()));
    }
  }
}
