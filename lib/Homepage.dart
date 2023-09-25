import 'package:first_app/welcome.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
         backgroundColor: Color.fromARGB(230, 124, 195, 233),
      body: Center(
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
            Container(
      child: Text("DocuCare is a user-friendly and comprehensive mobile application designed to revolutionize healthcare accessibility and patient-doctor interactions. This innovative app allows patients to easily book appointments with their preferred doctors",textAlign:TextAlign.justify,style: TextStyle(  color: Colors.white,
                     fontSize: 20.0,
                  fontWeight:FontWeight.bold,      
       ),),
   ),
   SizedBox(height: 80.0),
              
                ElevatedButton(
          onPressed:() {
             Navigator.push(
         context,
         MaterialPageRoute(builder: (context) => Page2()),
         );
          },
         child: Text('Get Started',style: TextStyle(  color:  Colors.white, fontSize: 30.0,)),
        style: ElevatedButton.styleFrom(
          backgroundColor:  Color(0xFF14BBEF),
        ),),

          ]),
          
      )
      );
    
  }
}
