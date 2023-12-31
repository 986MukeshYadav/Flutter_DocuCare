import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/drawer.dart';
import 'package:first_app/feedback.dart';
import 'package:flutter/material.dart';


class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool showTextFields = false;
  TextEditingController cardController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  DateTime? selectedExpiryDate;

  Future<void> _selectExpiryDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 10),
    ))!;

    if (picked != null && picked != selectedExpiryDate) {
      setState(() {
        selectedExpiryDate = picked;
        expiryDateController.text =
            "${picked.month}/${picked.year}"; // Format the date as needed
      });
    }
  }

  void savePayment() {
  String credit = cardController.text.trim();
  String expiry = expiryDateController.text.trim();
  String cvv = cvvController.text.trim();

  cardController.clear();
  expiryDateController.clear();
  cvvController.clear();

  if (credit.isNotEmpty && expiry.isNotEmpty && cvv.isNotEmpty) {
    Map<String, dynamic> userData = {
      "Credit": credit,
      "Expiry": selectedExpiryDate != null
          ? Timestamp.fromMillisecondsSinceEpoch(selectedExpiryDate!.millisecondsSinceEpoch)
          : null,
      "CVV": cvv,
    };
    FirebaseFirestore.instance.collection("Payment").add(userData);
    print("Payment Received Successful");
  } else {
    print("Please fill all the fields");
  }
}

  @override
  void dispose() {
    cardController.dispose();
    expiryDateController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer:CustomDrawer(),
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
                        content: const Text("Payment Received Successful"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => FeedBack()),
                              );
                            },
                            child: Container(
                              color: Color(0xFF14BBEF),
                              padding: const EdgeInsets.all(14),
                              child: const Text(
                                "OK",
                                style: TextStyle(fontSize: 15.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text('Pay', style: TextStyle(fontSize: 20.0),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff14bbef),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
