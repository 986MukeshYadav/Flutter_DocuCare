import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/verified.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(MaterialApp(
    home: Appointment(),
  ));
}

class Appointment extends StatefulWidget {
  const Appointment({Key? key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  TextEditingController nameController = TextEditingController();
  TextEditingController diseaseController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TextEditingController descriptionController = TextEditingController();

  bool _calendarOpen = false;

  void saveUser() {
    String Name = nameController.text.trim();
    String Disease = diseaseController.text.trim();
    String Location = locationController.text.trim();
    String Date = selectedDate.toLocal().toString();
    String Description = descriptionController.text.trim();

    nameController.clear();
    diseaseController.clear();
    locationController.clear();
    descriptionController.clear();

    if (Name.isNotEmpty &&
        Disease.isNotEmpty &&
        Location.isNotEmpty &&
        Date.isNotEmpty &&
        Description.isNotEmpty) {
      Map<String, dynamic> userData = {
        "Name": Name,
        "Disease": Disease,
        "Location": Location,
        "Date": Date,
        "Description": Description,
      };
      FirebaseFirestore.instance.collection("User").add(userData);
      log("User Created");

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Verified(userData: userData),
        ),
      );
    } else {
      log("Please fill all the fields");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Appointment")),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50.0),
            Text(
              'Book A Doctor',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 35.0),
            Container(
              width: 400.0,
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              width: 400.0,
              child: TextField(
                controller: diseaseController,
                decoration: InputDecoration(
                  labelText: 'What is Your Disease',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              width: 400.0,
              child: TextField(
                controller: locationController,
                decoration: InputDecoration(
                  labelText: 'Where is Your Location',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: () {
                setState(() {
                  _calendarOpen = !_calendarOpen;
                });
              },
              child: AbsorbPointer(
                absorbing: true,
                child: Container(
                  width: 400.0,
                  child: TextField(
                    controller: TextEditingController(
                      text: selectedDate.toLocal().toString().split(' ')[0],
                    ),
                    decoration: InputDecoration(
                      labelText: 'Date',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ),
            if (_calendarOpen)
              Container(
                width: 400.0,
                child: TableCalendar(
                  focusedDay: selectedDate,
                  firstDay: DateTime.now(),
                  lastDay: DateTime(DateTime.now().year + 1),
                  calendarFormat: CalendarFormat.month,
                  onFormatChanged: (format) {},
                  onPageChanged: (focusedDay) {
                    setState(() {
                      selectedDate = focusedDay;
                    });
                  },
                  selectedDayPredicate: (date) {
                    return isSameDay(selectedDate, date);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      selectedDate = selectedDay;
                      _calendarOpen = false;
                    });
                  },
                ),
              ),
            SizedBox(height: 20.0),
            Container(
              width: 400.0,
              child: TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description (Optional)',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 50),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                saveUser();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF14BBEF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(color: Color(0xFF14BBEF)),
                ),
                minimumSize: Size(150.0, 40.0),
              ),
              child: Text(
                'Book',
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
