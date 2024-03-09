 
import 'package:QuickTapChat/pages/chatpage.dart';
import 'package:QuickTapChat/pages/forgotpassword.dart';
import 'package:QuickTapChat/pages/home.dart';
import 'package:QuickTapChat/pages/signin.dart';
import 'package:QuickTapChat/pages/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: 'AIzaSyBf27rk4hX-eyAMyKdSFauMKykXPNisZqU',
        appId: '1:875045662941:android:c8c4791751a08341a7ab34',
        messagingSenderId: '875045662941',
        projectId: 'quickchatapp-42ddb',
        storageBucket: 'quickchatapp-42ddb.appspot.com'
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
     
      home: Home()
    );
  }
}

 