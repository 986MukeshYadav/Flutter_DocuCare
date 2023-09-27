import 'package:first_app/Specialist.dart';
import 'package:first_app/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class FeedBack extends StatefulWidget {
  const FeedBack({super.key});

  @override
  State<FeedBack> createState() => _FeedBackState();
}
  double _rating = 0;
TextEditingController _feedbackController=TextEditingController();
Future<void> saveFeed() async {
  String feedbackText = _feedbackController.text;
                      FirebaseFirestore firestore = FirebaseFirestore.instance;
                      await firestore.collection('feedback').add({
                        'rating': _rating,
                        'feedbackText': feedbackText,
                        'timestamp': FieldValue.serverTimestamp(),
                        
                      });
                      _feedbackController.clear();
                    
}

class _FeedBackState extends State<FeedBack> {

 // TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       endDrawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Give Feedback'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50.0),
              Text(
                'How Was Your Experience',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30.0),
              RatingBar.builder(
                initialRating: _rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemSize: 40.0,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _rating = rating;
                  });
                },
              ),
              SizedBox(height: 30.0),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Text(
                      'Feedback',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _feedbackController,
                  decoration: InputDecoration(
                    labelText: 'Enter your feedback',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 5,
                ),
              ),
               SizedBox(height: 30.0),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                  saveFeed();
                  showDialog(
				context: context,
				builder: (ctx) => AlertDialog(
				content: const Text("Thankyou So Much ! Your FeedBack is Saved"),
				actions: <Widget>[
					TextButton(
					onPressed: () {
						 Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Page4()),);
					},
					child: Container(
						color: Color(0xFF14BBEF), 
						padding: const EdgeInsets.all(14),
						child: const Text("okay", style: TextStyle(fontSize: 15.0,color: Colors.white),),
					),
					),
				],
				),
			);
                  
                  },
                  style: ElevatedButton.styleFrom(
                    
                    backgroundColor:Color(0xFF14BBEF), 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                       side: BorderSide(color:Color(0xFF14BBEF),), 
                    ),
                          minimumSize: Size(150.0, 40.0),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 25.0,color: Colors.white),
                     
                  ),
                ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                    Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Page4()),
              );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF14BBEF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(color: Color(0xFF14BBEF)),
                      ),
                      minimumSize: Size(150.0, 40.0),
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}