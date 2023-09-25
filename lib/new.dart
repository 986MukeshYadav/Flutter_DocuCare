import 'dart:convert';
import 'package:first_app/doctorlist.dart';
import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
class Choose extends StatefulWidget {
  const Choose({super.key});

  @override
  State<Choose> createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  List<SamplePosts> samplePosts =[];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context,snapshot) {
        if(snapshot.hasData){
          return
          ListView.builder(
          itemCount:samplePosts.length,
          itemBuilder:(context,index){
            return Container(
              height: 130,
              color: Colors.greenAccent,
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              margin:const EdgeInsets.all(10) ,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
              Text('User Id:${samplePosts[index].results}',
              style:TextStyle(fontSize: 18),),

              Text('Id:${samplePosts[index].info}',
              style:TextStyle(fontSize: 18),),

             
            ]),


            );
            
          } ,
        );

        }
       else{
        return Center(child: CircularProgressIndicator(),);
       }
      }
    );
      
    
  }

  Future<List<SamplePosts>>getData() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
 
 var data = jsonDecode(response.body.toString());
 if(response.statusCode==200){
  for(Map<String, dynamic>index in data){
    samplePosts.add(SamplePosts.fromJson(index));
  }
  return samplePosts;
 }
 else{
  return samplePosts;
 }
  }
}