import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/drawer.dart';
import 'package:first_app/ear_specialist.dart';
import 'package:first_app/signin_page.dart';
//import 'package:first_app/eye_specialist.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Page4 extends StatefulWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  final List<String> specialistList = [
    'Eye Specialist',
    'Ear Specialist',
    'Skin Specialist',
    'Cardiologist',
    'Dentist',
    'Gynecologist',
    'Oncologist',
    'Neurologist',
    'Nephrologist',
    'Anesthesiologist',
    'Radiologist',
    'Rheumatologist',
    'General',
    'Hematologist',
  ];

  String filterText = '';
  List<String> Find = [];

  @override
  void initState() {
    super.initState();
    Find.addAll(specialistList);
  }

  void Fliter() {
    setState(() {
      Find = specialistList
          .where((specialist) =>
              specialist.toLowerCase().contains(filterText.toLowerCase()))
          .toList();
    });
  }
  
 void signOut(BuildContext context) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signOut();
    if (googleUser != null) {
      await FirebaseAuth.instance.signOut();
    }
  }

 void SpecialDetails(String specialistName) {
  switch (specialistName) {
    case 'Eye Specialist':
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => EarSpecialistPage(),
      ));
      break;
    case 'Ear Specialist':
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => EarSpecialistPage(),
      ));
      break;
  
    default:
    
      break;
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer:CustomDrawer(),
      appBar: AppBar(
        title: Text(
          'Specialist',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff14BBEF),
       
        
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 370,
                color: Colors.white70,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      filterText = value;
                    });
                    Fliter(); 
                  },
                  decoration: InputDecoration(
                    hintText: 'Search Related',
                    prefixIcon: Icon(Icons.search, color: const Color(0xff14bbef)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(color: const Color(0xff14bbef)),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 600,
              width: 370,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: Find.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      SpecialDetails(Find[index]);
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 370,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            color: const Color.fromRGBO(190, 158, 158, 150),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10, right: 230),
                            child: Container(
                              height: 50,
                              child: Center(
                                child: Text(
                                  Find[index],
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10), 
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

 
}
