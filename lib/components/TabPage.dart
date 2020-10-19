

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Appetizers.dart';
import 'Drinks.dart';
import 'Pasta.dart';
import 'Sandwich.dart';
import 'SoupSalad.dart';

class TabPage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<TabPage> with TickerProviderStateMixin {
  TabController _tcontroller;

  final List<String> appbarImages = [
    'appetizer_appbar.jpg',
    'soupsalad_appbar.jpg',
    'sandwich_appbar.jpg',
    'pasta_appbar.jpg',
    'drinks_appbar.jpg',
  ];
  String currentAppbarImage;

  @override
  void initState() {
    currentAppbarImage = appbarImages[0];
    _tcontroller = TabController(length: 5, vsync: this);
    _tcontroller.addListener(changeImage);
  }

  void changeImage() {
    setState(() {
      // get index of active tab & change current appbar title
      currentAppbarImage = appbarImages[_tcontroller.index];
      print("this TabBar index ${_tcontroller.index}");
    });
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 150,
          flexibleSpace: Image.asset(
            'assets/images/$currentAppbarImage',
            fit: BoxFit.cover,
          ),
          title: Text('Allen King\'s Cafe'),
          bottom: TabBar(
            controller: _tcontroller,
            labelColor: Colors.green,
            labelStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            labelPadding: EdgeInsets.zero,
            unselectedLabelColor: Colors.orange,
            indicatorColor: Colors.green,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Container(
                width: 100,
                color: Color(0xaaf9f9f9),
                child: Tab(
                  text: 'Appetizers',
                ),
              ),
              Container(
                width: 100,
                color: Color(0xaaf9f9f9),
                child: Tab(
                  text: 'Soup/Salad',
                ),
              ),
              Container(
                width: 100,
                color: Color(0xaaf9f9f9),
                child: Tab(
                  text: 'Sandwich',
                ),
              ),
              Container(
                width: 100,
                color: Color(0xaaf9f9f9),
                child: Tab(
                  text: 'Pasta',
                ),
              ),
              Container(
                width: 100,
                color: Color(0xaaf9f9f9),
                child: Tab(
                  text: 'Drinks',
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tcontroller,
          children: [Appetizers(), SoupSalad(), Sandwich(), Pasta(), Drinks()],
        ),
      ),
    );
  }
}
