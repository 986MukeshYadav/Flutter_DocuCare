import 'package:first_app/docter_details.dart';
import 'package:first_app/drawer.dart';
import 'package:first_app/product_page.dart';
import 'package:flutter/material.dart';

class ChooseDoctor extends StatelessWidget {
  const ChooseDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

     appBar: AppBar(
      title: Text('Choose Your Doctor',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      centerTitle: true,
      backgroundColor: const Color(0xff14BBEF),
      actions:[IconButton(icon: Icon(Icons.menu, color: Colors.white),
      onPressed: () {
         Navigator.push(
         context,
         MaterialPageRoute(builder: (context) => DrawerPage()),
         );
      },
        )
        ]
       ),

    body: Container(child: ListView(children: [
          Column(
          children: [
          Padding(
                  padding: const EdgeInsets.all(12.0),
                   child: Container(
                    height: 50,
                    width: 350,
                    color: Colors.white70,
                    child: TextField(
                      decoration: InputDecoration(
                      hintText: 'Search nearby you',
                      prefixIcon: Icon(Icons.search, color:const Color (0xff14bbef)),
                      focusedBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:BorderSide(color:const Color (0xff14bbef)),
                      )
                      )
                      )
                      ),
                      ),

                     Container(
                      height: 600,
                      width:320,
                      child:ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                       
                        Container(
                         height:210,
                         width:320,
                         decoration: BoxDecoration(
                          color: const Color.fromRGBO(190, 158, 158, 150),
                          borderRadius: BorderRadius.circular(15),
                          ),

                          child:Container(   
                            child: Column(
                              children: [
                              Container(height:5),
                               
                                  CircleAvatar(
                                  backgroundImage:AssetImage('assets/doc2.jpeg'),
                                  radius:50,
                                ),
                               
                                Container(height:5),
                                
                                InkWell(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder:(context) => DoctorDetails(),));},
                                child:Text('Dr. Mukesh',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
                                InkWell(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder:(context) => DoctorDetails(),));},
                                child:Text('Janakpur',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold))),
          
                              ],
                            ),
                         ),),
                        
                         Container(height: 10),

                          Container(
                         height:180,
                         width:320,
                         decoration: BoxDecoration(
                        color: const Color.fromRGBO(190, 158, 158, 150),
                          borderRadius: BorderRadius.circular(15),
                          ),
                          child:Container(
                            child: Column(
                              children: [
                                Container(height:5),
                                CircleAvatar(
                                  child:InkWell(onTap: (){
                                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => DoctorDetails(),));},),
                                  backgroundImage:AssetImage('assets/doc1.png'),
                                  radius:50,
                                ),
                                Container(height:5),
                                Text('Dr. Ranjan',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                                Text('Dhalkebar',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                              ],
                            ),
                          )
                         ),

                         Container(height: 10),

                          Container(
                         height:180,
                         width:320,
                         decoration: BoxDecoration(
                         color: const Color.fromRGBO(190, 158, 158, 150),
                          borderRadius: BorderRadius.circular(15),
                          ),
                          child:Container(
                            child: Column(
                              children: [
                                Container(height:5),
                                CircleAvatar(
                                  child:InkWell(onTap: (){
                                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductPage(),));},),
                                  backgroundImage:AssetImage('assets/doc3.png'),
                                  radius:50,
                                ),
                                Container(height:5),
                                Text('Dr. Pawan',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                                Text('Kathmandu',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                              ],
                            ),
                          )
                         ),
                        
                        Container(height: 10),

                          Container(
                         height:180,
                         width:320,
                         decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                          ),
                          child:Container(
                            child: Column(
                              children: [
                                Container(height:5),
                                CircleAvatar(
                                  child:InkWell(onTap: (){
                                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductPage(),));},),
                                 // backgroundImage:AssetImage('assets/images/7.jpeg'),
                                  radius:50,
                                ),
                                Container(height:5),
                                Text('Dr. Kajal',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                                Text('Pokhara',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                              ],
                            ),
                          )
                         ),

                         Container(height: 10),

                          Container(
                         height:180,
                         width:320,
                         decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                          ),
                          child:Container(
                            child: Column(
                              children: [
                                Container(height:5),
                                CircleAvatar(
                                  child:InkWell(onTap: (){
                                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductPage(),));},),
                                  //backgroundImage:AssetImage('assets/images/5.jpeg'),
                                  radius:50,
                                ),
                                Container(height:5),
                                Text('Dr. Shiv',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                                Text('Lumbani',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                              ],
                            ),
                          )
                         ),

                         Container(height: 10),

                          Container(
                         height:180,
                         width:320,
                         decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                          ),
                          child:Container(
                            child: Column(
                              children: [
                                Container(height:5),
                                CircleAvatar(
                                  child:InkWell(onTap: (){
                                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductPage(),));},),
                                 // backgroundImage:AssetImage('assets/images/8.jpeg'),
                                  radius:50,
                                ),
                                Container(height:5),
                                Text('Dr. Sejal',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                                Text('Jaleshower',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                              ],
                            ),
                          )
                         ),

                      ],
                      )
                      ),
      ],
    ),
    ]),),
 );
}
}