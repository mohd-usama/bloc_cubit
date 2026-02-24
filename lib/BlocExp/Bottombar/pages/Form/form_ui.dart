import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../DashBoard/dasbaord_bloc.dart';
import '../../../../DashBoard/dasbaord_event.dart';
import '../../../../DashBoard/dashbaord_screen.dart';
import 'form_bloc.dart';
import 'form_event.dart';
import 'form_state.dart';

class FormUi extends StatelessWidget {
  const FormUi({super.key});

  @override
  Widget build(BuildContext context) {
    FocusNode userNameNode = FocusNode();
    FocusNode passwordNode = FocusNode();

    return Scaffold(
        appBar: AppBar(
          title: Text("Form"),
        ),
        body: BlocConsumer<FormBloc, FormStateClass>(
          listenWhen: (previous, current) {
            return previous.errorMsg != current.errorMsg || previous.success != current.success;
          },
          listener: (context, state) {
            if (state.errorMsg != null) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg!)));
              if (state.userName.isEmpty) {
                FocusScope.of(context).requestFocus(userNameNode);
              } else if (state.password.isEmpty) {
                FocusScope.of(context).requestFocus(passwordNode);
              }
            }

            if (state.success == "Success") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => DashbaordScreen()),
              );
            }
          },
          builder: (BuildContext context, FormStateClass state) {
            return Column(
              children: [
                /// Dropdown
                DropdownButton<String>(
                  value: state.selectedItem,
                  items: state.dropdownItems.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                  onChanged: (v) => context.read<FormBloc>().add(DropdownChanged(v!)),
                ),

                /// Checkbox
                Checkbox(
                  value: state.isChecked,
                  onChanged: (v) => context.read<FormBloc>().add(CheckboxChanged(v!)),
                ),

                /// Slider
                Slider(
                  value: state.sliderValue,
                  min: 0,
                  max: 100,
                  onChanged: (v) => context.read<FormBloc>().add(SliderChanged(v)),
                ),

                /// Radio
                Row(
                  children: ['A', 'B', 'C'].map((e) {
                    return Radio<String>(
                      value: e,
                      groupValue: state.selectedRadio,
                      onChanged: (v) => context.read<FormBloc>().add(RadioChanged(v!)),
                    );
                  }).toList(),
                ),
                TextFormField(
                  focusNode: userNameNode,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    context.read<FormBloc>().add(UserNameChange(value));
                  },
                ),
                TextFormField(
                  focusNode: passwordNode,
                  decoration: const InputDecoration(
                    labelText: 'password',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    context.read<FormBloc>().add(PasswordChange(value));
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<FormBloc>().add(LoginButtonPress());
                  },
                  child: const Text('Submit'),
                ),
              ],
            );
          },
        ));
  }
}
