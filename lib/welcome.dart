import 'package:first_app/signin_page.dart';
import 'package:first_app/signup_page.dart';
import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});
   onClick() {
    print('Button Clicked');
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Color.fromARGB(230, 124, 195, 233),
     body: Column(
       children: [
         Center(
           child: Padding(
             padding: const EdgeInsets.all(70.0),
             child: Text(
               "Welcome to",
               style: TextStyle(
                 color: Colors.white,
                 fontSize: 40.0,
                 fontWeight:FontWeight.bold,
               ),
             ),
             ),
            ),
         Container(
          height: 250,
          width:200,
          padding: const EdgeInsets.all(0.0),
          child:Image.asset('assets/mky2.png',fit:BoxFit.cover)
          ),

           Center(
           child: Padding(
             padding: const EdgeInsets.all(20.0),
             child: Text(
               "DocuCare",
               style: TextStyle(
                 color: Colors.white,
                 fontSize: 40.0,
                 fontWeight:FontWeight.bold,
               ),
             ),
             
             ),
            ),
             Center(
           child: Padding(
             padding: const EdgeInsets.all(3.0),
             child: Text(
               "-Your Health, Our Priority-",
               style: TextStyle(
                 color: Colors.white,
                 fontSize: 20.0,
                 fontWeight:FontWeight.bold,
               ),
             ),
             
             ),
            ),
           
           Container(
            height: 200,
             child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
               children: [
                 Center(
                   child: Padding(
                     padding: const EdgeInsets.all(30.0),
                     child:ElevatedButton(
          onPressed:() {
             Navigator.push(
         context,
        MaterialPageRoute(builder: (context) => Page3()),
         );
          },
         child: Text('Login',style: TextStyle(  color:  Colors.white, fontSize: 20.0,)),
        style: ElevatedButton.styleFrom(
          backgroundColor:  Color(0xFF14BBEF),
        ),),),

                 ),
                  Center(
                   child: Padding(
                     padding: const EdgeInsets.all(10.0),
                     child:ElevatedButton(
          onPressed:() {
             Navigator.push(
         context,
         MaterialPageRoute(builder: (context) => Page5()),
         );
          },
         child: Text('SignUp',style: TextStyle(  color:  Colors.white, fontSize: 20.0,)),
        style: ElevatedButton.styleFrom(
          backgroundColor:  Color(0xFF14BBEF),
        ),),

                     
                   ),
                 ),
               ],
             ),
           ),]
     ),
   );
 }
}