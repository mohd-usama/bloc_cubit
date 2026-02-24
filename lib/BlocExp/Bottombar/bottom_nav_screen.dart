import 'package:cubit/BlocExp/Bottombar/bottom_nav_bloc.dart';
import 'package:cubit/BlocExp/Bottombar/bottom_nav_event.dart';
import 'package:cubit/BlocExp/Bottombar/bottom_nav_state.dart';
import 'package:cubit/BlocExp/Bottombar/pages/Form/form_ui.dart';
import 'package:cubit/BlocExp/Bottombar/pages/Profile/profile_screen.dart';
import 'package:cubit/BlocExp/Bottombar/pages/Second/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Widget> pages = [
      FormUi(),
      SecondScreen(),
      ProfileScreen(),
    ];

    return BlocBuilder<BottomNavBloc, BottomNavState>(builder: (context, state) {
      return Scaffold(
        body: pages[state.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(color: Colors.blue),
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          onTap: (index) {
            context.read<BottomNavBloc>().add(BottomNavChange(index));
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: state.currentIndex == 0 ? Colors.blue : Colors.grey,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: state.currentIndex == 1 ? Colors.blue : Colors.grey,
                ),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: state.currentIndex == 2 ? Colors.blue : Colors.grey,
                ),
                label: 'Profile'),
          ],
        ),
      );
    });
  }
}
