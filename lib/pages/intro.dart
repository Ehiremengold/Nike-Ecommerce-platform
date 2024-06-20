// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            // logo
            Padding(
              padding: const EdgeInsets.all(25),
              child: Image.asset('assets/images/nike.png', height: 240,),
            ),
          
            SizedBox(height: 48,),
            // title
          
            Text('Just Do It', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            const SizedBox(height: 24,),
          
            // sub title
            Text('Brand new sneakers and custom kicks made with premium quality', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.grey),),
            const SizedBox(height: 48,),

            // start now button

            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/homepage'),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.grey[900], borderRadius: BorderRadius.circular(12)),
                child: Center(child: Text('Shop now', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),))
              ),
            )
          ]),
        ),
      ),
    );
  }
}