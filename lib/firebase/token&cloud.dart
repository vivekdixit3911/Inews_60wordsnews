import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void tokenstore() async {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  try {
    String? token = await _firebaseMessaging.getToken();
    await _firebaseMessaging.requestPermission();

    // Get the previous token from Firestore
    DocumentSnapshot<Map<String, dynamic>> previousTokenDocument =
        await _firebaseFirestore
            .collection('Users')
            .doc('kkoken') // Replace 'token' with the actual document ID
            .get() as DocumentSnapshot<Map<String, dynamic>>;
    print(previousTokenDocument.data());
    // Get the token from the document
    String? previousToken = await previousTokenDocument.data()?['kkoken'];
    print(previousToken);
    if (token != previousToken) {
      try {
        await _firebaseFirestore.collection('Users').add({"kkoken": token});
        print('User added to Firestore $token');
      } catch (e) {
        print('Error NOT adding user to Firestore: $e');
      }
    }
  } catch (e) {
    print("it's okey to get failed some time $e");
  }
}
