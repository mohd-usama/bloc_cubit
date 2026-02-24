import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  final String? userCode;
  final String? userName;
  final String? bCode;
  final String? languageCode;
  final String? phone;
  final String? emailID;
  final String? userType;
  final String? permanentAddress;
  final String? localAddress;
  final String? status;
  final String? message;

   LoginModel({
    this.userCode,
    this.userName,
    this.bCode,
    this.languageCode,
    this.phone,
    this.emailID,
    this.userType,
    this.permanentAddress,
    this.localAddress,
    this.status,
    this.message,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      userCode: json['UserCode'],
      userName: json['UserName'],
      bCode: json['BCode'],
      languageCode: json['LanguageCode'],
      phone: json['Phone'],
      emailID: json['EmailID'],
      userType: json['UserType'],
      permanentAddress: json['PermanentAddress'],
      localAddress: json['LocalAddress'],
      status: json['Status'],
      message: json['Message'],
    );
  }

  @override
  List<Object?> get props => [
        userCode,
        userName,
        bCode,
        languageCode,
        phone,
        emailID,
        userType,
        permanentAddress,
        localAddress,
        status,
        message,
      ];
}
