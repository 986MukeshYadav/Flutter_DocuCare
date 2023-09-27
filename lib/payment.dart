import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/drawer.dart';
import 'package:first_app/verified.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key? key}) : super(key: key);
   


  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}
 TextEditingController cardController = TextEditingController();
TextEditingController expiryController = TextEditingController();
TextEditingController cvvController = TextEditingController();


class _PaymentScreenState extends State<PaymentScreen> {
  bool showTextFields = false;
  TextEditingController expiryDateController = TextEditingController();
  DateTime? selectedExpiryDate;
 



  Future<void> _selectExpiryDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 10),
    ))!;

    if (picked !=null && picked != selectedExpiryDate) {
      setState(() {
        selectedExpiryDate = picked;
        expiryDateController.text =
            "${picked.month}/${picked.year}"; // Format the date as needed
      });
    }
  }

  @override
  void dispose() {
    expiryDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Payment'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            height: 700,
            width: 500,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Container(
                    child: Column(
                      children: [
                        Text('Total cost',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text('Rs.500',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xff14bbef))),
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Choose Your Payment Method:',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                showTextFields = true;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.credit_card), 
                                SizedBox(width: 8), 
                                Text(
                                  'Credit Card',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 10,
                              ),
                              backgroundColor: Color(0xff14bbef),
                            ),
                          ),
                          if (showTextFields)
                            SizedBox(height: 20,),
                            Column(
                              children: [
                                TextFormField(
                                 controller: cardController,
                                  decoration: InputDecoration(
                                    labelText: 'Credit Card Number',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20,),
                                GestureDetector(
                                  onTap: () {
                                    _selectExpiryDate(context);
                                  },
                                  child: AbsorbPointer(
                                    child: TextFormField(
                                      controller: expiryDateController,
                                      decoration: InputDecoration(
                                        labelText: 'Expiry Date',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20,),
                                TextFormField(
                                  controller: cvvController,
                                  decoration: InputDecoration(
                                    labelText: 'CVV',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {
                    savePayment();
                     showDialog(
				context: context,
				builder: (ctx) => AlertDialog(
				content: const Text("Payment Received  Successful"),
				actions: <Widget>[
					TextButton(
					onPressed: () {
						 Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Verified()),);
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
                  child: Text('Pay', style: TextStyle(fontSize: 20.0),),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff14bbef)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
 
  }
  void savePayment(){
     String Credit = cardController.text.trim();
    String Expiry = expiryController.text.trim();
    String CVV= cvvController.text.trim();
   

    cardController.clear();
    expiryController.clear();
    cvvController.clear();
    


    if(Credit==""|| Expiry==""|| CVV==""){
     Map<String,dynamic> userData={
      "Credit":Credit,
      "Expiry":DateTime.timestamp(),
      "CVV":CVV,
     };
      FirebaseFirestore.instance.collection("Payment").add(userData);
      log("User Created");

    }
    else{
      log("Please fill all the fields");
    }
  }
}
