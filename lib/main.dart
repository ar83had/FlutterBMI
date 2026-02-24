import 'package:flutter/material.dart';
import 'package:bmi/homepage.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext build){
    return MaterialApp(
      home:HomePage(),
    );
  }
}