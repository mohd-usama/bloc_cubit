import 'package:cubit/BlocExp/Bottombar/pages/Second/second_bloc.dart';
import 'package:cubit/BlocExp/Bottombar/pages/Second/second_event.dart';
import 'package:cubit/BlocExp/Bottombar/pages/Second/second_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController!.addListener(() {
      if (tabController!.indexIsChanging) {
        context.read<SecondBloc>().add(TabBarChange(tabController!.index));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SecondBloc, SecondState>(
      listenWhen: (prev, curr) => prev.currentIndex != curr.currentIndex,
      listener: (context, state) {
        if (tabController!.index != state.currentIndex) {
          tabController!.animateTo(state.currentIndex);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("SS"),
          bottom: TabBar(
            controller: tabController,
            tabs: const [
              Tab(text: 'Tab 1'),
              Tab(text: 'Tab 2'),
              Tab(text: 'Tab 3'),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: const [
            Center(child: Text("Tab A")),
            Center(child: Text("Tab B")),
            Center(child: Text("Tab C")),
          ],
        ),
      ),
    );
  }
}
