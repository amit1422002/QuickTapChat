 
import 'package:QuickTapChat/pages/chatpage.dart';
import 'package:QuickTapChat/pages/home.dart';
import 'package:QuickTapChat/pages/signin.dart';
import 'package:QuickTapChat/pages/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
     
      home: Chatpage(),
    );
  }
}

 