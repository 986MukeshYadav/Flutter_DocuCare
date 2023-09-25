import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EarSpecialistPage extends StatefulWidget {
  @override
  State<EarSpecialistPage> createState() => _EarSpecialistPageState();
}

class _EarSpecialistPageState extends State<EarSpecialistPage> {

List<dynamic> users=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eye Specialist Detail'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context,index){
          final user = users[index];
           final name=user['name']['first'];
          final email=user['email'];
           final imageUrl=user['picture']['thumbnail'];
        return ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(100),
          child: Image.network(imageUrl)),
          title: Text(name.toString()),
          subtitle: Text(email),
        );
      }),
      //floatingActionButton: FloatingActionButton(onPressed: fetchUsers,),
      
    );
  }
  void fetchUsers()async{
    
    const url='https://randomuser.me/api/?results=100';
    final uri=Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json=jsonDecode(body);
    setState(() {
      users=json['results'];
    });
   
  }
}
