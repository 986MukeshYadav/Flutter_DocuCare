import 'package:first_app/appointment.dart';
import 'package:first_app/drawer.dart';
import 'package:flutter/material.dart';

class UserDetailPage extends StatelessWidget {
  final Map<String, dynamic> user;

  UserDetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    final name = "Dr. " + user['name']['first'];
    final email = user['email'];
    final imageUrl = user['picture']['thumbnail'];
    final country = user['location']['country'];
    final address = user['location']['street']['name'];
    final fees = "Consultation Fees: \$50"; // You can modify this as needed
    final contactNumber = user['phone'];
    final experience = "Experience: 5 years"; // You can modify this as needed

    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: AppBar(
        title: Center(child: Text('Doctor List')),
      ),
      body: Center(
        child: Column(
          children: [
            Card(
              elevation: 5,
              margin: EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(imageUrl),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Dr. $name',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black, // You can customize the color
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5,
              margin: EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Email: $email", style: TextStyle(fontSize: 18)),
                    SizedBox(height: 10),
                    Text("Country: $country", style: TextStyle(fontSize: 18)),
                    SizedBox(height: 10),
                    Text("Address: $address", style: TextStyle(fontSize: 18)),
                    SizedBox(height: 10),
                    Text("Contact Number: $contactNumber", style: TextStyle(fontSize: 18)),
                    SizedBox(height: 10),
                    Text(experience, style: TextStyle(fontSize: 18)),
                    SizedBox(height: 10),
                    Text(fees, style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20), 
            ElevatedButton(
              onPressed: () {
                Navigator.push(
         context,
         MaterialPageRoute(builder: (context) => Appointment()),
         );
              },
              child: Text('Book'),
            ),
          ],
        ),
      ),
    );
  }
}
