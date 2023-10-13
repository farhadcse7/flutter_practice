import 'package:flutter/material.dart';
import 'package:flutter_practice/home_screen.dart';
void main(){
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
