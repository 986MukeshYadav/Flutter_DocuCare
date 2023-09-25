import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/Specialist.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Page3 extends StatefulWidget {
  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
   bool isLoggedIn = false;
  late String name;

  void login() async {
    String email = emailController.text.trim();
    String password = pwdController.text.trim();
    if (email == "" || password == "") {
      log("Please fill all the details");
    } else {
      try{   
      UserCredential userCredential = 
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email, password: password);
      if(userCredential.user !=null){
        Navigator.popUntil(context, (route) =>route.isFirst);
         Navigator.push(
         context,
         MaterialPageRoute(builder: (context) => Page4()),
         );
      }
      }on FirebaseAuthException catch(ex){

        log(ex.code.toString());
      }
    }


   



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(230, 124, 195, 233),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 110.0),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3.0),
              ),
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(0, 124, 195, 233),
                radius: 100.0,
                backgroundImage: AssetImage('assets/mky.gif'),
              ),
            ),
            SizedBox(height: 20.0),
            Image.asset('assets/mky1.png'),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  emailTextField(),
                  SizedBox(height: 16.0),
                  passwordTextField(),
                  SizedBox(height: 24.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                            Navigator.push(
                             context,
                            MaterialPageRoute(builder: (context) => Page5()),
                             );
                        },
                        child: Text(
                          'Create Account?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
          onPressed:() {
            login();
          },
         child: Text('Sign In',style: TextStyle(  color:  Colors.white, fontSize: 20.0,)),
        style: ElevatedButton.styleFrom(
          backgroundColor:  Color(0xFF14BBEF),
        ),
        ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Divider(
                  color: Colors.white,
                  thickness: 1.5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'or',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              Expanded(
                child: Divider(
                  color: Colors.white,
                  thickness: 1.5,
                ),
              ),
            ],
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
              GestureDetector(
                //onTap: _facebookSignIn, // Attach the _facebookSignIn function
                child: Image.asset('assets/google.png', height: 40.0), // Adjust the height as needed
              ),
              SizedBox(width: 16.0), // Add spacing between logos
              GestureDetector(
                //onTap: _googleSignIn, // Attach the _googleSignIn function
                child: Image.asset('assets/Facebook.png', height: 40.0), // Adjust the height as needed
              ),
            ],
          ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget emailTextField() {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.orange,
            width: 2,
          ),
        ),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.green,
        ),
        labelText: "Email",
        hintText: "Email",
      ),
    );
  }

  Widget passwordTextField() {
    return TextFormField(
      controller: pwdController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.orange,
            width: 2,
          ),
        ),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.green,
        ),
        labelText: "Password",
        hintText: "Password",
      ),
    );
  }
  
}
