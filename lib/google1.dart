// import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
// import 'package:flutter/material.dart';

// class Google1 extends StatefulWidget {
//   @override
//   State<Google1> createState() => _Google1State();
// }

// class _Google1State extends State<Google1> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController pwdController = TextEditingController();

//   // Function to handle Google Sign-In
//    void signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//       if (googleUser != null) {
//         final GoogleSignInAuthentication googleAuth =
//             await googleUser.authentication;
//         final AuthCredential credential = GoogleAuthProvider.credential(
//           accessToken: googleAuth.accessToken,
//           idToken: googleAuth.idToken,
//         );

//         final UserCredential userCredential =
//             await FirebaseAuth.instance.signInWithCredential(credential);

//         if (userCredential.user != null) {
//           Navigator.popUntil(context, (route) => route.isFirst);
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => Page4()),
//           );
//         }
//       }
//     } catch (e) {
//       log(e.toString());
//     }
//   }

//   void login() async {
//     String email = emailController.text.trim();
//     String password = pwdController.text.trim();
//     if (email == "" || password == "") {
//       log("Please fill in all the details");
//     } else {
//       try {
//         UserCredential userCredential = await FirebaseAuth.instance
//             .signInWithEmailAndPassword(email: email, password: password);
//         if (userCredential.user != null) {
//           Navigator.popUntil(context, (route) => route.isFirst);
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => Page4()),
//           );
//         }
//       } on FirebaseAuthException catch (ex) {
//         log(ex.code.toString());
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(230, 124, 195, 233),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(height: 110.0),
//             Container(
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(color: Colors.white, width: 3.0),
//               ),
//               child: CircleAvatar(
//                 backgroundColor: Color.fromARGB(0, 124, 195, 233),
//                 radius: 100.0,
//                 backgroundImage: AssetImage('assets/mky.gif'),
//               ),
//             ),
//             SizedBox(height: 20.0),
//             Image.asset('assets/mky1.png'),
//             SizedBox(height: 20.0),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   emailTextField(),
//                   SizedBox(height: 16.0),
//                   passwordTextField(),
//                   SizedBox(height: 24.0),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       TextButton(
//                         onPressed: () {},
//                         child: Text(
//                           'Forgot Password?',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20.0,
//                           ),
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => Page5()),
//                           );
//                         },
//                         child: Text(
//                           'Create Account?',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20.0,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 50.0),
//                   ElevatedButton(
//                     onPressed: () {
//                       login();
//                     },
//                     child: Text(
//                       'Sign In',
//                       style: TextStyle(color: Colors.white, fontSize: 20.0),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xFF14BBEF),
//                     ),
//                   ),
//                   SizedBox(height: 16.0),
//                   ElevatedButton(
//                     onPressed: () {
//                       signInWithGoogle();
//                     },
//                     child: Text(
//                       'Sign In with Google',
//                       style: TextStyle(color: Colors.white, fontSize: 20.0),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xFF14BBEF),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget emailTextField() {
//     return TextFormField(
//       controller: emailController,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.teal,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.orange,
//             width: 2,
//           ),
//         ),
//         prefixIcon: Icon(
//           Icons.person,
//           color: Colors.green,
//         ),
//         labelText: "Email",
//         hintText: "Email",
//       ),
//     );
//   }

//   Widget passwordTextField() {
//     return TextFormField(
//       controller: pwdController,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.teal,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.orange,
//             width: 2,
//           ),
//         ),
//         prefixIcon: Icon(
//           Icons.person,
//           color: Colors.green,
//         ),
//         labelText: "Password",
//         hintText: "Password",
//       ),
//     );
//   }
// }

// class Page4 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Your Page4 widget code here
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Page 4'),
//       ),
//       body: Center(
//         child: Text('Welcome to Page 4!'),
//       ),
//     );
//   }
// }

// class Page5 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Your Page5 widget code here
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Page 5'),
//       ),
//       body: Center(
//         child: Text('Welcome to Page 5!'),
//       ),
//     );
//   }
// }


