import 'package:bachelorapp/src/constants/Text/Text.dart';
import 'package:bachelorapp/src/features/screens/services_screen/Service_registeration/grocery_registration.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Groceries extends StatelessWidget {
  const Groceries({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(groceries.toUpperCase()),
        centerTitle: true,
      ),
      body: GroceryServiceListPage(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(shape: CircleBorder(),
          onPressed:(){
          Get.to(()=>GroceryRegistrationPage());
          } ,
          child: Text('Register'.toUpperCase()),
        ),
      ),
    );
  }
}
class GroceryServiceListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('groceries').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No Grocery services available'),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.black12,
                  ),
                  child: ListTile(
                    title: Text(data['name']),
                    subtitle: Text(data['location']),
                    trailing: Text(data['offer']),
                    onTap: () {
                      _launchPhoneCall(data['mobile']);
                    },
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
Future<void> _launchPhoneCall(String phoneNumber) async {
  final url = 'tel:$phoneNumber';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
