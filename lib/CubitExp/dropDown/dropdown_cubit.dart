import 'package:cubit/CubitExp/dropDown/dropdown_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropdownCubit extends Cubit<DropdownState> {
  DropdownCubit() : super(InitialState()){
    loadDropDown();
  }

  void loadDropDown() {
    emit(LoadingState());

    List<String> dropDownList = ["A", "B", "C", "D", "E"];
    emit(LoadedState(dropDownList: dropDownList, selectedItem:dropDownList.first ));
  }


  void changeSelection(String value) {
    final current = state;
    if (current is LoadedState) {
      emit(LoadedState(
        dropDownList: current.dropDownList,
        selectedItem: value,
      ));
    }
  }

}
