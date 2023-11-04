import 'dart:async';
import 'package:first_app/Homepage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
    super.initState();
  
  Timer(Duration(seconds: 3),(){

Navigator.pushReplacement(context,
 MaterialPageRoute(builder: 
 (Context)=>HomePage()));
  });}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(230, 124, 195, 233),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/splash.png', 
                width: 500, 
                height: 500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}