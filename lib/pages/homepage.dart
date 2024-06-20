// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:nikestore/components/bottom_nav_bar.dart';
import 'package:nikestore/pages/cartpage.dart';
import 'package:nikestore/pages/shoppage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  void navigateBottomBar (index){
    setState(() {
      _selectedIndex = index;
    });
  }

  List _pages = [
    ShopPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/nike.png', width: 50,),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left:13),
          child: Builder(
            builder: (context) {
              return IconButton(onPressed: () {Scaffold.of(context).openDrawer();}, icon: Icon(Icons.menu));
            }
          ),
        ),
      ),
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(child: Image.asset('assets/images/nike.png', color: Colors.white,)),

                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: ListTile(
                    leading: Icon (Icons.home_rounded, color: Colors.white,),
                    title: Text('Home', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: ListTile(
                    leading: Icon (Icons.info, color: Colors.white,),
                    title: Text('About', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 35, bottom: 25),
              child: ListTile(
                leading: Icon (Icons.logout, color: Colors.white,),
                title: Text('Logout', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              ),
            )
          ],
        )
      ),
      body: _pages[_selectedIndex],
    );
  }
}