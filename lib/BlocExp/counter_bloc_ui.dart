import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';
import 'counter_bloc_events.dart';
import 'counter_bloc_state.dart';

class CounterBlocUi extends StatelessWidget {
  const CounterBlocUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: Column(
        children: [
          Text("You have click the button"),
          Center(
            child: BlocBuilder<CounterBloc, CounterBlocState>(builder: (context, state) {
              return Text(state.count.toString());
            }),
          ),
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(IncrementCounter());
                      },
                      child: Text("Increment"))),
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(DecrementCounter());
                      },
                      child: Text("Decrement")))
            ],
          ),
          BlocBuilder<CounterBloc, CounterBlocState>(builder: (context, state) {
            return Checkbox(
                value: state.isCheckBox,
                onChanged: (v) {
                  context.read<CounterBloc>().add(CheckBoxValue(v!));
                });
          })
        ],
      ),
    );
  }
}
