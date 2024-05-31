import 'package:bachelorapp/src/features/Chat/chat_with_user.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';



class UserListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Emails'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Users').snapshots(),
        builder: (context, snapshot) {
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
          final users = snapshot.data!.docs;
          final currentUserEmail = FirebaseAuth.instance.currentUser!.email;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index].data() as Map<String, dynamic>;
              final email = user['email'] ?? 'Email not available';
              final uid = user['uid'] ?? 'UID not available';
              // Skip the current user's email
              if (email == currentUserEmail) {
                return SizedBox.shrink();
              }
              return GestureDetector(
                onTap: () {
                  Get.to(() => ChatRoomPage(
                    currentUserID: FirebaseAuth.instance.currentUser!.uid,
                    selectedUserID: uid,
                  ));
                },
                child: ListTile(
                  leading: Icon(Icons.person), // Constant icon
                  title: Text(email), // User's email
                ),
              );
            },
          );
        },
      ),
    );
  }
}
