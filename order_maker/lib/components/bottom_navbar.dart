import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyButtomNavBar extends StatelessWidget {
  final void Function(int)? onTabChange;

  const MyButtomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: GNav(
        activeColor: Colors.white,
        color: Colors.grey[200],
        onTabChange: (value) => onTabChange!(value),
        tabActiveBorder: Border.all(color: Colors.white),
        mainAxisAlignment: MainAxisAlignment.center,
        tabs: const [
          GButton(
            icon: Icons.home,
            text: "Shop",
          ),
          GButton(
            icon: Icons.shopping_bag,
            text: "Cart",
          ),
        ],
      ),
    );
  }
}
