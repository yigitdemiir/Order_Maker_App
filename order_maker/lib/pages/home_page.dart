// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:order_maker/components/bottom_navbar.dart';
import 'package:order_maker/pages/cart_page.dart';
import 'package:order_maker/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int newIndex) {
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  final List<Widget> _pages = const [
    ShopPage(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      bottomNavigationBar: MyButtomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
