import 'package:cubit/CubitExp/ApiExample/list_cubit.dart';
import 'package:cubit/CubitExp/dropDown/dropdown_cubit.dart';
import 'package:cubit/DashBoard/dasbaord_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'BlocExp/Bottombar/bottom_nav_bloc.dart';
import 'BlocExp/Bottombar/pages/Form/form_bloc.dart';
import 'BlocExp/Bottombar/pages/Second/second_bloc.dart';
import 'CubitExp/ApiExample/list_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ListCubit>(
            create: (context) => ListCubit(),
          ),
          BlocProvider<DropdownCubit>(
            create: (context) => DropdownCubit(),
          ),
          BlocProvider<FormBloc>(
            create: (_) => FormBloc(),
          ),
          BlocProvider<BottomNavBloc>(
            create: (_) => BottomNavBloc(),
          ),
          BlocProvider<SecondBloc>(
            create: (_) => SecondBloc(),
          ),
          BlocProvider(create: (_) => DasbaordBloc()),
        ],
        child: MaterialApp(
          title: 'Cubit and Bloc Example',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: PostsPage(),
        ));
  }
}
