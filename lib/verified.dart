// import 'package:flutter/material.dart';

// class Verified extends StatelessWidget {
//   const Verified({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text("Notification")),
//       ),
//        body:SingleChildScrollView(
//       child:
//        Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Image.asset('assets/verified.png'),
//              SizedBox(height:5.0),
//             Text(
//               'Your Request Has Been Approved',
//               style: TextStyle(
//                 fontSize: 25.0,
//                 fontWeight:FontWeight.bold,
//               ),
//             ),
//           ]
//        ),
//        )
//        )
//     );
//   }
// }

import 'package:first_app/drawer.dart';
import 'package:first_app/feedback.dart';
import 'package:flutter/material.dart';

class Verified extends StatelessWidget {
  const  Verified({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(
          'Approved',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF14BBEF),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: Text(
                "Approved Successful!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ClipOval(
            child: CircleAvatar(
              backgroundColor: Colors.white,
                radius: 100.0,

              child: Image.asset(
                'assets/verified.png',
                fit: BoxFit.cover, 
              ),
            ),
          ),
         SizedBox(
                    height: 30,
                  ),
         Text('Thanks For Visiting',
         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          SizedBox(
                    height: 50,
                  ),
       ElevatedButton(
          onPressed:() {
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FeedBack()),
              );
          },
          child:Text("Done",
          style: TextStyle(color: Colors.white),
          ),
        style: ElevatedButton.styleFrom(
          backgroundColor:  Color(0xFF14BBEF),
        ),
        ),    
        ],
      ),
    );
  }
}