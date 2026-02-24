import 'package:cubit/CubitExp/ApiExample/list_cubit.dart';
import 'package:cubit/CubitExp/ApiExample/list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../BlocExp/Bottombar/bottom_nav_screen.dart';
import '../../BlocExp/Bottombar/pages/Form/form_ui.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  void initState() {
    super.initState();
    context.read<ListCubit>().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Posts (Cubit)"),actions: [
        ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=>BottomNavScreen()));
        }, child: Text("Move"))
      ],),
      body: BlocBuilder<ListCubit, ListState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is LoadedState) {
            return ListView.builder(
              itemCount: state.userList.length,
              itemBuilder: (context, index) {
                final post = state.userList[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(post.title!),
                    subtitle: Text(post.body!),
                  ),
                );
              },
            );
          }

          if (state is ErrorState) {
            return Center(child: Text(state.errorMsg));
          }

          return const SizedBox();
        },
      ),
    );
  }
}
