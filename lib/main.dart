//import 'package:first_app/ear_specialist.dart';
//import 'package:first_app/welcome.dart';
//import 'package:first_app/Homepage.dart';
//import 'package:first_app/page4.dart';
//import 'package:first_app/page5.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:first_app/feedback.dart';
//import 'package:first_app/appointment.dart';
import 'package:first_app/firebase_options.dart';
//import 'package:first_app/signin_page.dart';
import 'package:first_app/google1.dart';
//import 'package:first_app/signin_page.dart';
//import 'package:first_app/payment.dart';
//import 'package:first_app/new.dart';
//import 'package:first_app/verified.dart';


import 'package:flutter/material.dart';


 

//import 'Homepage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home:Google1()
    );
  }
}