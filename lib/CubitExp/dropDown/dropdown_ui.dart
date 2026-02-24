import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dropdown_cubit.dart';
import 'dropdown_state.dart';

class DropdownUi extends StatelessWidget {
  const DropdownUi({super.key});

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text("DropDown"),
      ),
      body: Column(
        children: [
          BlocBuilder<DropdownCubit, DropdownState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return const CircularProgressIndicator();
              }

              if (state is LoadedState) {
                return DropdownButton<String>(
                  isExpanded: true,
                  value: state.selectedItem,
                  items: state.dropDownList.map((item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      context.read<DropdownCubit>().changeSelection(value);
                    }
                  },
                );
              }

              if (state is ErrorState) {
                return Text(state.error);
              }

              return const SizedBox();
            },
          )
        ],
      ),
    );
  }
}
