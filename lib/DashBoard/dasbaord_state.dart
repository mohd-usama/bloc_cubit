import 'package:cubit/Model/LoginModel.dart';
import 'package:equatable/equatable.dart';

import '../Model/statusListModel.dart';

class DasbaordState extends Equatable {
  final bool isLoading;
  final LoginModel? loginModel;
  final List<StatusListModel> statusList;
  final String status;

   DasbaordState({this.isLoading = false, this.loginModel, this.statusList =const [], this.status = ""});

  DasbaordState copyWith({bool? isLoading, LoginModel? loginModel, List<StatusListModel>? statusList, String? status}) {
    return DasbaordState(
        isLoading: isLoading ?? this.isLoading,
        loginModel: loginModel ?? this.loginModel,
        statusList: statusList ?? this.statusList,
        status: status ?? this.status);
  }

  @override
  List<Object?> get props => [isLoading, loginModel, statusList, status];
}
