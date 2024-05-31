import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/house_model.dart';
import 'HouseDetails.dart';

class HouseListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Houses Near You'.toUpperCase()),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('houses').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final List<HouseForRent> houses = (snapshot.data?.docs ?? []).map((DocumentSnapshot doc) {
            final data = doc.data() as Map<String, dynamic>;
            return HouseForRent(
              id: doc.id,
              houseName: data['houseName'],
              address: data['address'],
              location: data['location'],
              bhk: data['bhk'],
              bikeParking: data['bikeParking'],
              carParking: data['carParking'],
              noParking: data['noParking'],
              rentAmount: data['rentAmount'],
              advanceAmount: data['advanceAmount'],
              phoneNumber: data['phoneNumber'],
              imageUrls: List<String>.from(data['houseImages'] ?? []),
              rating: data['rating'] ?? 0.0,
            );
          }).toList();
          return ListView.builder(
            itemCount: houses.length,
            itemBuilder: (BuildContext context, int index) {
              return HouseCard(house: houses[index]);
            },
          );
        },
      ),
    );
  }
}

class HouseCard extends StatefulWidget {
  final HouseForRent house;

  HouseCard({required this.house});

  @override
  _HouseCardState createState() => _HouseCardState();
}

class _HouseCardState extends State<HouseCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to detailed page when pressed
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HouseDetailsPage(house: widget.house)),
        );
      },
      child: Card(
        margin: EdgeInsets.all(8.0),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display images of houses
            CarouselSlider(
              options: CarouselOptions(
                height: 300.0,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                viewportFraction: 1.0, // Show only one image at a time
              ),
              items: widget.house.imageUrls.map((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),

            // Display name and rent amount
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.house.houseName,
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text('Location: ${widget.house.location}'),
                  Text('Rent: \₹${widget.house.rentAmount}'),
                  Text('Advance: \₹${widget.house.advanceAmount}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
