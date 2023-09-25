import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';



class Page5 extends StatefulWidget {
  const Page5({super.key}) ;

  @override
  State<Page5> createState() => _Page5State();
}

class _Page5State extends State<Page5> {

 PickedFile? imageFile; 
final ImagePicker _picker = ImagePicker();

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController cpwdController = TextEditingController();
 

  void createFunction() async {
    String Name = nameController.text.trim();
    String Age = ageController.text.trim();
    String Phone = phoneController.text.trim();
    String Address = addController.text.trim();
    String Email = emailController.text.trim();
    String Password = pwdController.text.trim();
    String ConformPassword = cpwdController.text.trim();

    
    if (Name==""|| Age==""|| Phone==""|| Address==""|| Email == "" || Password == "" || ConformPassword=="") {
      log("Please fill all the details");
    } 
    else if(Password != ConformPassword){
      log("Password donot match");
    }
    else {
      try{
          
      UserCredential userCredential = 
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: Email, password: Password);
      if(userCredential.user !=null){
        Navigator.pop(context);
      }
      }on FirebaseAuthException catch(ex){

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
          onPressed: () {  
           },
             ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: <Widget>[
                  imageProfile(context),
                  SizedBox(
                    height: 20,
                  ),
                  nameTextField(),
                  SizedBox(
                    height: 20,
                  ),
                  ageTextField(),
                  SizedBox(
                    height: 20,
                  ),
                  phoneTextField(),
                  SizedBox(
                    height: 20,
                  ),
                  addressTextField(),
                  SizedBox(
                    height: 20,
                  ),
                  emailTextField(),
                  SizedBox(
                    height: 20,
                  ),
                  passwordTextField(),
                  SizedBox(
                    height: 20,
                  ),
                  confirmpasswordTextField(),
                  SizedBox(
                    height: 20,
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
                    child: Text('Register',style: TextStyle(  color:  Colors.white, fontSize: 20.0,)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget imageProfile(BuildContext context){
        return Center(
          child: Stack(
            children: <Widget> [
              CircleAvatar(
                radius: 80.0,
                backgroundImage: imageFile == null ? AssetImage("assets/logo.png"):FileImage(File(imageFile!.path)) as ImageProvider,
              ),
              Positioned(
                bottom:20.0,
                right: 20.0,
                child:InkWell(
                  onTap:(){
                      void _showSearch() {
                  showModalBottomSheet(
                    context: context,
                    builder: ((Builder) => bottomSheet()),
                  );
                }

                _showSearch();
                  },

                  child:Icon(
                  Icons.camera_alt,
                  color:Colors.teal,
                  size: 28.0,
                  ),
                ),
              ),
            ],
          ),
        );
  }

  Widget bottomSheet(){
     return Container(
      height: 100.0,
      //width: MediaQuery.of(context).size.width,
      margin:EdgeInsets.symmetric(
        horizontal:20,
        vertical: 20,
      ),
     child: Column(
      children:<Widget>[
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
          children:<Widget> [
           TextButton.icon(
            icon:Icon(Icons.camera),
            onPressed:(){
                 takePhoto(ImageSource.camera);
            },
            label:Text("Camera"),
           ),
           TextButton.icon(
            icon:Icon(Icons.camera),
            onPressed:(){
                takePhoto(ImageSource.gallery);
            },
            label:Text("Gallery"),
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

 Widget  nameTextField(){
        return TextFormField(
          controller: nameController,
          decoration:InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.teal,
              ),
            ),
            focusedBorder:OutlineInputBorder(
              borderSide: BorderSide(
                color:Colors.orange,
                width: 2,
              ),
            ),
            prefixIcon: Icon(
              Icons.person,
              color:Colors.green,
            ),
            labelText:  "Name",
            helperText: "Name can't be empty",
            hintText: "Name",
          ),    
        );
  }

   Widget  ageTextField(){
        return TextFormField(
          controller: ageController,
          decoration:InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.teal,
              ),
            ),
            focusedBorder:OutlineInputBorder(
              borderSide: BorderSide(
                color:Colors.orange,
                width: 2,
              ),
            ),
            prefixIcon: Icon(
              Icons.person,
              color:Colors.green,
            ),
            labelText:  "Age",
            helperText: "Age can't be empty",
            hintText: "Age",
          ),    
        );
  }

   Widget  phoneTextField(){
        return TextFormField(
          controller: phoneController,
          decoration:InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.teal,
              ),
            ),
            focusedBorder:OutlineInputBorder(
              borderSide: BorderSide(
                color:Colors.orange,
                width: 2,
              ),
            ),
            prefixIcon: Icon(
              Icons.person,
              color:Colors.green,
            ),
            labelText:  "Phone no",
            helperText: "Phone number can't be empty",
            hintText: "Phone no",
          ),    
        );
  }

 Widget  addressTextField(){
        return TextFormField(
          controller: addController,
          decoration:InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.teal,
              ),
            ),
            focusedBorder:OutlineInputBorder(
              borderSide: BorderSide(
                color:Colors.orange,
                width: 2,
              ),
            ),
            prefixIcon: Icon(
              Icons.person,
              color:Colors.green,
            ),
            labelText:  "Address",
            helperText: "Address can't be empty",
            hintText: "Address",
          ),    
        );
  }

 Widget emailTextField(){
        return TextFormField(
          controller: emailController,
          decoration:InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.teal,
              ),
            ),
            focusedBorder:OutlineInputBorder(
              borderSide: BorderSide(
                color:Colors.orange,
                width: 2,
              ),
            ),
            prefixIcon: Icon(
              Icons.person,
              color:Colors.green,
            ),
            labelText:  "Email",
            helperText: "Email can't be empty",
            hintText: "Email",
          ),    
        );
  }

   Widget passwordTextField(){
        return TextFormField(
          controller: pwdController,
          decoration:InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.teal,
              ),
            ),
            focusedBorder:OutlineInputBorder(
              borderSide: BorderSide(
                color:Colors.orange,
                width: 2,
              ),
            ),
            prefixIcon: Icon(
              Icons.person,
              color:Colors.green,
            ),
            labelText:  "Password",
            helperText: "Password can't be empty",
            hintText: "Password",
          ),    
        );
  }

   Widget confirmpasswordTextField(){
        return TextFormField(
          controller: cpwdController,
          decoration:InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.teal,
              ),
            ),
            focusedBorder:OutlineInputBorder(
              borderSide: BorderSide(
                color:Colors.orange,
                width: 2,
              ),
            ),
            prefixIcon: Icon(
              Icons.person,
              color:Colors.green,
            ),
            labelText:  "Confirm Password",
            helperText: "Confirm Password can't be empty",
            hintText: "Confirm Password",
          ),    
        );
  }
}