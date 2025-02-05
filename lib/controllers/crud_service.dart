import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CRUDService {
   
  // save fcm token for firestore
  static Future saveUserToken(String token) async {
   User? user = FirebaseAuth.instance.currentUser;
    Map<String, dynamic> data = {
      "email": user!.email,
      "token": token,
    };

    try{
      await FirebaseFirestore.instance
       .collection("user_data")
       .doc(user!.uid)
       .set(data);

       print('document added user uid ${user.uid}'); 
    } catch(e){
      print('Err CRUDService ==>> error in saving to firestore');
      print(e.toString());
    }
  }
}
