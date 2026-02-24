
import 'package:cubit/DashBoard/dasbaord_bloc.dart';
import 'package:cubit/DashBoard/dasbaord_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashbaordScreen extends StatelessWidget {
  const DashbaordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard"),),
      body: BlocBuilder<DasbaordBloc,DasbaordState>(builder: (context, state) {
        return Column(
          children: [
          Text(state.loginModel!.userCode!),
            Expanded(child: ListView.builder(
                itemCount: state.statusList.length,
                itemBuilder: (Context, int index){
              return Text(state.statusList[index].packetStatus!);
            }))
          ],
        );
      },)
    );
  }
}
