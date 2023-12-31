import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';


class Page5 extends StatefulWidget {
  const Page5({super.key});

  @override
  State<Page5> createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  PickedFile? imageFile;
  final ImagePicker _picker = ImagePicker();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController cpwdController = TextEditingController();

  String? nameError;
  String? emailError;
  String? pwdError;
  String? cpwdError;

  void createFunction() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = pwdController.text.trim();
    String confirmPassword = cpwdController.text.trim();

    setState(() {
      nameError = name.isEmpty ? "Name can't be empty" : null;
      emailError = email.isEmpty ? "Email can't be empty" : null;
      pwdError = password.isEmpty ? "Password can't be empty" : null;
      cpwdError = confirmPassword.isEmpty ? "Confirm Password can't be empty" : null;
    });

    if (nameError != null || emailError != null || pwdError != null || cpwdError != null) {
      log("Please fill all the details");
    } else if (password != confirmPassword) {
      log("Passwords do not match");
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (userCredential.user != null) {
          Navigator.pop(context);
        }
      } on FirebaseAuthException catch (ex) {
        log(ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text('Registration'),
              centerTitle: true,
              backgroundColor: Color(0xFF14BBEF),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Stack(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 80.0,
                          backgroundImage: imageFile == null ? AssetImage("assets/logo.png") : FileImage(File(imageFile!.path)) as ImageProvider,
                        ),
                        Positioned(
                          bottom: 20.0,
                          right: 20.0,
                          child: InkWell(
                            onTap: () {
                              void _showSearch() {
                                showModalBottomSheet(
                                  context: context,
                                  builder: ((Builder) => bottomSheet()),
                                );
                              }

                              _showSearch();
                            },
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.teal,
                              size: 28.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: nameController,
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
                      labelText: "Name",
                    
                      hintText: "Name",
                    ),
                  ),
                  if (nameError != null)
                    Text(
                      nameError!,
                      style: TextStyle(color: Colors.red),
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
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
                  ),
                  if (emailError != null)
                    Text(
                      emailError!,
                      style: TextStyle(color: Colors.red),
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: pwdController,
                    obscureText: true,
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
                  ),
                  if (pwdError != null)
                    Text(
                      pwdError!,
                      style: TextStyle(color: Colors.red),
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: cpwdController,
                    obscureText: true,
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
                      labelText: "Confirm Password",
                      hintText: "Confirm Password",
                    ),
                  ),
                  if (cpwdError != null)
                    Text(
                      cpwdError!,
                      style: TextStyle(color: Colors.red),
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      createFunction();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF14BBEF),
                    ),
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                icon: Icon(Icons.camera),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                label: Text("Camera"),
              ),
              TextButton.icon(
                icon: Icon(Icons.camera),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                label: Text("Gallery"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(
        source: source,
      );

      if (pickedFile != null) {
        print("Image Path: ${pickedFile.path}");
        setState(() {
          imageFile = pickedFile as PickedFile?;
        });
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }
}
