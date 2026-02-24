import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit.dart';
import 'counter_state.dart';

class CounterUi extends StatelessWidget {
  const CounterUi({super.key});

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
            child: BlocBuilder<CounterCubit, CounterState>(builder: (context, state) {
              return Text(state.count.toString());
            }),
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterCubit>().incrementCounter();
                  },
                  child: Text("Increment")),
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterCubit>().decrementCounter();
                  },
                  child: Text("Decrement")),
            ],
          )
        ],
      ),
    );
  }
}
