import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
        padding: EdgeInsets.zero,
        children: [
        UserAccountsDrawerHeader(
        accountName:Text("Pawan Kumar Sah") , 
        accountEmail: Text("psah770@rku.ac.in"),
        currentAccountPicture: CircleAvatar(
        child: ClipOval( child:Image.asset('assets/images/pawan1.jpg')),
        ),
        decoration: BoxDecoration(
          color: Colors.blue,
         image: DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1497384401032-2182d2687715?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80'),
         fit:BoxFit.cover)

        )
        
        ),
        ListTile(
        leading: Icon(Icons.favorite),
        title: Text('Favourite'),
        onTap: ()=>null,
         ),

         ListTile(
        leading: Icon(Icons.share),
        title: Text('Share'),
        onTap: ()=>null,
         ),

        ListTile(
        leading: Icon(Icons.reviews),
        title: Text('Rate the App '),
        onTap: ()=>null,
         ),

          ListTile(
        leading: Icon(Icons.feedback),
        title: Text('Feedback '),
        onTap: ()=>null,
         ),

         Divider(),
         ListTile(
        leading: Icon(Icons.logout),
        title: Text('logout'),
        onTap: ()=>null,
         ),
        ],),
    );
    
    
  }
}