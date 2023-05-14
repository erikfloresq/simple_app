import 'package:flutter/material.dart';
import 'package:simple_app/characters_list.dart';
import 'package:simple_app/favorite_list.dart';

class SimpleApp extends StatelessWidget {
  const SimpleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimpleAppRoot();
  }
}

class SimpleAppRoot extends StatefulWidget {
  const SimpleAppRoot({super.key});

  @override
  State<SimpleAppRoot> createState() {
    return _SimpleAppState();
  }
}

class _SimpleAppState extends State<SimpleAppRoot> {
  int _selectedTabIndex = 0;
  static const List<Widget> _widgetOptions = [CharactersList(), FavoriteList()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SimpleApp',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Simple App'),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedTabIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.people), label: 'Characters'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorites'),
          ],
          currentIndex: _selectedTabIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
