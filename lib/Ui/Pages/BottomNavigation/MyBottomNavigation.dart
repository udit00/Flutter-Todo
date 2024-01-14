import 'package:flutter/material.dart';
import 'package:todo_flutter_app/Ui/Pages/Home/HomeScreen.dart';

class MyBottomNavigation extends StatefulWidget {
  const MyBottomNavigation({super.key});

  @override
  State<MyBottomNavigation> createState() => _MyBottomNavigationState();
}

class CustomBottomNavItems {
  late BottomNavigationBarItem bottomNavigationBarItem;
  late Widget widget;
  CustomBottomNavItems(this.bottomNavigationBarItem, this.widget);
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {

  int _selectedIndex = 0;
  static List<CustomBottomNavItems> customBottomNavItemList = <CustomBottomNavItems>[
    CustomBottomNavItems(
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home'
      ),
      const HomeScreen()
    ),
    CustomBottomNavItems(
      const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile'
      ),
      const Text("Person Screen", style: optionStyle,)
    ),
  ];
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> navBarItems = List.empty(growable: true);
    for (var item in customBottomNavItemList) {
      navBarItems.add(item.bottomNavigationBarItem);
    }
    return Scaffold(
      body: customBottomNavItemList.elementAt(_selectedIndex).widget,
      bottomNavigationBar: BottomNavigationBar(
        items: navBarItems,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      )
    );
  }
}