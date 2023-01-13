import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
          selectedIcon: Icon(Icons.home),
        ),
        NavigationDestination(
          icon: Icon(Icons.add_box_outlined),
          label: 'Create Proposal',
          selectedIcon: Icon(Icons.add_box),
        ),
        NavigationDestination(
          icon: Icon(Icons.view_list_outlined),
          label: 'Queue',
          selectedIcon: Icon(Icons.view_list),
        ),
        NavigationDestination(
          icon: Icon(Icons.settings_outlined),
          label: 'Settings',
          selectedIcon: Icon(Icons.settings),
        ),
      ],
      selectedIndex: currentIndex,
      onDestinationSelected: (int index) {
        setState(() {
          currentIndex = index;
        });
      },
    );
  }
}
