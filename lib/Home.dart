import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/MyOrder.dart';
import 'components/Services.dart';
import 'components/TabPage.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  int _selectedIndex;
  List<Widget> _pages;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print("this is BottomNavigationBar index ${_selectedIndex}");
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    _pages = List()..add(TabPage())..add(MyOrder())..add(Services());
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'My Order',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Services',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
