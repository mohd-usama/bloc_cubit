import 'dart:convert';

import 'package:cubit/CubitExp/ApiExample/Model/list_model.dart';
import 'package:http/http.dart' as http;
import 'package:cubit/CubitExp/ApiExample/list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCubit extends Cubit<ListState> {
  ListCubit() : super(InitialState());

  Future<void> fetchData() async {
    emit(LoadingState());
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      List<ListModel> actualdata = [];
      List data = jsonDecode(response.body);
      for (var v in data) {
        actualdata.add(ListModel.fromJson(v));
      }
      emit(LoadedState(actualdata));
    } else {
      emit(ErrorState("Failed to load "));
    }
  }
}
