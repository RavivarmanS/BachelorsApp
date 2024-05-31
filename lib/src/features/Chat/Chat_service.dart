import 'package:bachelorapp/src/features/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  //get instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //get user stream
  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  //send message
  Future<void> sendMessage(String receiverID, message) async {
    //get current user info
    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    //create a new message
    Message newMessage = Message(
        senderID: currentUserEmail,
        senderEmail: currentUserID,
        receiverID: receiverID,
        message: message,
        timestamp: timestamp);
    //construct a chat room id for two user
    List<String> ids = [currentUserID, receiverID];
    ids.sort(); // sort  the ids (this ensure the chatroomId is  the same for any 2 people)
    String chatRoomID = ids.join('_');

    //add message to db
    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .add(newMessage.toMap());
  }

//get messages

  Stream<QuerySnapshot> getMessages(String userID, otherUSerID) {
    List<String> ids = [userID, otherUSerID];
    ids.sort();
    String chatRoomID = ids.join('_');
    return _firestore
        .collection("chat_rooms")
        .doc()
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
