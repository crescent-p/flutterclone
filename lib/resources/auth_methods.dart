// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';

// import '../utils/storage.dart';

// class AuthMethods {
//   //creating instances of firebase auth and firestore for authentication and database

//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _storage = FirebaseFirestore.instance;

//   Future<String> signUpUser({
//     required String email,
//     required String password,
//     required String username,
//     required String bio,
//     required Uint8List profilePhoto,
//   }) async {
//     String res = "An error occured";
//     try {
//       if (email.isNotEmpty ||
//           password.isNotEmpty ||
//           username.isNotEmpty ||
//           bio.isNotEmpty) {
//         UserCredential cred = await _auth.createUserWithEmailAndPassword(
//           email: email,
//           password: password,
//         );
//         String uid = cred.user!.uid;
//         String url = await StorageMethod().uploadImage(
//           childname: "profile",
//           isPost: false,
//           file: profilePhoto,
//         );
//         print(uid);
//         //delete collection users
//         _storage.collection("users").doc(uid).delete();

//         _storage.collection('users').doc(uid).set({
//           'username': username,
//           'email': email,
//           'uid': uid,
//           'bio': bio,
//           'followers': [],
//           'following': [],
//           'profilephotourl': url
//         });
//         res = "Success";
//         return res;
//       }
//     } catch (e) {
//       return e.toString();
//     }
//     return res;
//   }

//   Future<String> signInUser(
//       {required String email, required String password}) async {
//     String res = "An error occured";
//     try {
//       if (email.isNotEmpty && password.isNotEmpty) {
//         await _auth.signInWithEmailAndPassword(
//             email: email, password: password);
//         res = "Success";
//         return res;
//       } else {
//         res = "Please fill all the fields";
//         return res;
//       }
//     } catch (e) {
//       return e.toString();
//     }
//   }
// }
