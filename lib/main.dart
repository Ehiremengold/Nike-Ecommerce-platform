// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nikestore/data/cart.dart';
import 'package:nikestore/pages/homepage.dart';
import 'package:nikestore/pages/intro.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {

  await Hive.initFlutter();

  var box =  await Hive.openBox('myBox');
  
  runApp(ChangeNotifierProvider(
    create: (context) => Cart(),
    child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(dividerTheme: const DividerThemeData(color: Colors.transparent),),
      home: IntroPage(),
      routes: {
        '/homepage': (context) => HomePage(), 
      },
    );
  }
}
