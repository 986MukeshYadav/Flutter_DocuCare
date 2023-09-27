import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/feedback.dart';
import 'package:first_app/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Pawan Kumar Sah"),
            accountEmail: Text("psah770@rku.ac.in"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(child: Image.asset('assets/doc1.png')),
            ),
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1497384401032-2182d2687715?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80'),
                  fit: BoxFit.cover,
                )),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.reviews),
            title: Text('Rate the App '),
            onTap: () => _navigateToFeedbackPage(context),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('logout'),
            onTap: () {
              signOut(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Page3()),
              );
            },
          ),
        ],
      ),
    );
  }
 void signOut(BuildContext context) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signOut();
    if (googleUser != null) {
      await FirebaseAuth.instance.signOut();
    }
  } 
  
  void _navigateToFeedbackPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FeedBack(),
      ),
    );
  }
}
