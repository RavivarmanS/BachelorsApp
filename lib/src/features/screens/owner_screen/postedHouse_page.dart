import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyPostedHousesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Posted Houses'),
      ),
      body: MyPostedHousesList(),
    );
  }
}

class MyPostedHousesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String currentUserId = FirebaseAuth.instance.currentUser!.uid;

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('houses')
          .where('ownerId', isEqualTo: currentUserId)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final houses = snapshot.data!.docs;

        if (houses.isEmpty) {
          return Center(child: Text('You have not posted any houses yet.'));
        }

        return ListView.builder(
          itemCount: houses.length,
          itemBuilder: (context, index) {
            final house = houses[index].data() as Map<String, dynamic>;
            return ListTile(
              title: Text(house['houseName']),
              subtitle: Text(house['address']),
              // Add more details as needed
            );
          },
        );
      },
    );
  }
}
