// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {

  void Function(int)? onTabChange;

  BottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        gap: 8,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade100,
        activeColor: Colors.black,
        padding: EdgeInsets.all(10),
        color: Colors.grey[400],
        tabs: [
          GButton(icon: Icons.home_rounded, text: 'Shop',),
          GButton(icon: Icons.shopping_bag_rounded, text: 'Cart',),
      ]),
    );
  }
}