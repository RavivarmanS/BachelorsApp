import 'package:bachelorapp/src/features/Chat/User_list_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/house_model.dart';

class HouseDetailsPage extends StatelessWidget {
  final HouseForRent house;

  HouseDetailsPage({Key? key, required this.house}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls=house.imageUrls;
    return Scaffold(
      appBar: AppBar(
        title: Text('House Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                house.houseName,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Text('Address: ${house.address}'),
              SizedBox(height: 8.0),
              Text('Location: ${house.location}'),
              SizedBox(height: 8.0),
              Text('BHK: ${house.bhk}'),
              SizedBox(height: 8.0),
              Text('Rent Amount: ${house.rentAmount}'),
              SizedBox(height: 8.0),
              Text('Advance Amount: ${house.advanceAmount}'),
              SizedBox(height: 8.0),
              Text('Phone Number: ${house.phoneNumber}'),
              SizedBox(height: 8.0),
              if (house.bikeParking) Text('Bike Parking Available'),
              if (house.carParking) Text('Car Parking Available'),
              if (house.noParking) Text('No Parking Available'),
              SizedBox(height: 8.0,),
              Text('Images:', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              SizedBox(height: 8.0),
              Container(
                height: 300, // Adjust the height as needed
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imageUrls.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Image.network(
                        imageUrls[index],
                        width: 300, // Adjust the width as needed
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  _makePhoneCall(house.phoneNumber);
                },
                child: Text('Call Owner'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() =>
                UserListPage());
                },
          child: Icon(Icons.chat)),
    );
  }
}

void _makePhoneCall(String phoneNumber) async {
  if (await canLaunch('tel:$phoneNumber')) {
    await launch('tel:$phoneNumber');
  } else {
    throw 'Could not launch $phoneNumber';
  }
}

