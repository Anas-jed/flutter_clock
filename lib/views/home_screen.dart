import 'package:flutter/material.dart';

import '../exports_all.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedNavigationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const Center(child: ClockView()),
        Center(
          child: Text(
            '$selectedNavigationIndex',
            style: const TextStyle(color: Colors.black),
          ),
        ),
        const Center(child: StopWatchView()),
        Center(
          child: Text(
            '$selectedNavigationIndex',
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ][selectedNavigationIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) => setState(() {
          selectedNavigationIndex = value;
        }),
        selectedIndex: selectedNavigationIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.lock_clock), label: "Clock"),
          NavigationDestination(icon: Icon(Icons.woman), label: "World"),
          NavigationDestination(icon: Icon(Icons.timer), label: "StopWatch"),
          NavigationDestination(icon: Icon(Icons.watch), label: "Counter"),
        ],
      ),
    );
  }
}
