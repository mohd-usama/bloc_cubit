import 'dart:async';

import 'package:cubit/DashBoard/dasbaord_event.dart';
import 'package:cubit/DashBoard/dasbaord_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../ConstApi/const_api.dart';
import '../Model/statusListModel.dart';
import '../Support/PreferenceManager.dart';

class DasbaordBloc extends Bloc<DasbaordEvent, DasbaordState> {
  DasbaordBloc() : super(DasbaordState()) {
    on<LoginModelLoad>(_loginModelLoad);
    on<StatusListLoad>(_statusLoadList);
    add(LoginModelLoad());
  }

  Future<void> _loginModelLoad(LoginModelLoad event, Emitter<DasbaordState> emit) async {
    final login = await PreferenceManager.instance.getLoginDetails();
    if (login != null) {
      emit(state.copyWith(loginModel: login));
      add(StatusListLoad());
    }
  }

  Future<FutureOr<void>> _statusLoadList(StatusListLoad event, Emitter<DasbaordState> emit) async {
    Map map = {
      "Token": "SIPL25XTYNDUECMSMEVDEMO0926",
      "UserCode": state.loginModel!.userCode,
      "LanguageCode": "EN",
    };

    try {
      var v = await ConstApi().getHitAPI(map, "https://beta59.sagarinfotech.com/CMS_MEDemoApi/api/Android/GetStatus");
      if (v != null) {
        List<StatusListModel> data = [];

        v["StatusLists"].forEach((e) {
          data.add(StatusListModel.fromJson(e));
        });
        emit(state.copyWith(statusList: data));
        emit(state.copyWith(status: v["Message"]));
      } else {
        emit(state.copyWith(status: v["Message"]));
        emit(state.copyWith(statusList: []));
      }
    } catch (cc) {
      emit(state.copyWith(statusList: []));
      emit(state.copyWith(status: cc.toString()));
    }
  }
}
