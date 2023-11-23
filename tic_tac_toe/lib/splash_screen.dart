import 'dart:async';
import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/main.dart';

class splash extends StatefulWidget{

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5),(){
      Navigator.pushReplacement(context as BuildContext, MaterialPageRoute(builder:(context) =>MyApp(),));
    });
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
body: Container(
  color: Colors.blue,
  child: const Center(
    child: Image(image: NetworkImage('https://img.favpng.com/9/25/1/tic-tac-toe-tic-tac-toe-spiegel-wikipedia-warum-png-favpng-JS76Y7V63zDjW2ZNjrVDiYqzE.jpg'),),
  ),

),
   );
  }
}