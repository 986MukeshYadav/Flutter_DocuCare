import 'package:first_app/choose_doctor.dart';
import 'package:first_app/ear_specialist.dart';
//import 'package:first_app/eye_specialist.dart';
import 'package:flutter/material.dart';


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

 void SpecialDetails(String specialistName) {
  switch (specialistName) {
    case 'Eye Specialist':
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ChooseDoctor(),
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
      drawer: Drawer(
        child: ListView(
        padding: EdgeInsets.zero,
        children: [
        UserAccountsDrawerHeader(
        accountName:Text("Pawan Kumar Sah") , 
        accountEmail: Text("psah770@rku.ac.in"),
        currentAccountPicture: CircleAvatar(
        child: ClipOval( child:Image.asset('assets/doc1.png')),
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
      ),
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
