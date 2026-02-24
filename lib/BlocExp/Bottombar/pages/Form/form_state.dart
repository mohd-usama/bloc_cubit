import 'package:equatable/equatable.dart';

class FormStateClass extends Equatable {
  final bool isLoading;
  final List<String> dropdownItems;
  final String? selectedItem;
  final bool isChecked;
  final double sliderValue;
  final String selectedRadio;
  final String userName;
  final String password;
  final String? errorMsg;
  final String? success;

  const FormStateClass({
    this.isLoading = false,
    this.dropdownItems = const [],
    this.selectedItem,
    this.isChecked = false,
    this.sliderValue = 0,
    this.selectedRadio = 'A',
    this.userName="",
    this.password="",
    this.errorMsg,
    this.success,
  });

  FormStateClass copyWith({
    bool? isLoading,
    List<String>? dropdownItems,
    String? selectedItem,
    bool? isChecked,
    double? sliderValue,
    String? selectedRadio,
    String? userName,
    String? password,
    String? error,
    String? success,
  }) {
    return FormStateClass(
      isLoading: isLoading ?? this.isLoading,
      dropdownItems: dropdownItems ?? this.dropdownItems,
      selectedItem: selectedItem ?? this.selectedItem,
      isChecked: isChecked ?? this.isChecked,
      sliderValue: sliderValue ?? this.sliderValue,
      selectedRadio: selectedRadio ?? this.selectedRadio,
      userName: userName ?? this.userName,
      password: password ?? this.password,
      errorMsg: error ?? this.errorMsg,
      success: success?? this.success,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        dropdownItems,
        selectedItem,
        isChecked,
        sliderValue,
        selectedRadio,
        userName,
        password,
        errorMsg,
    success
      ];
}
