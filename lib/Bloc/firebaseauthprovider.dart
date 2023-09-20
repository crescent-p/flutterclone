import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutterclone/Bloc/auth_provider.dart';
import 'package:flutterclone/Bloc/auth_user.dart';
import 'package:flutterclone/Exceptions/AuthExceptions.dart';
import '../firebase_options.dart';

class FirebaseAuthProvider implements AuthProvider {
  @override
  Future<void> initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  @override
  AuthUser? get currentUser {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return AuthUser.fromFirebase(user);
    } else {
      return null;
    }
  }

  @override
  Future<AuthUser?> login(String email, String password) async {
    try {
      UserCredential cred =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return AuthUser.fromFirebase(cred.user!);
    } catch (e) {
      throw AuthUserLoginException();
    }
  }

  Future<String> logout() async {
    String res = "An error occured";
    try {
      await FirebaseAuth.instance.signOut();
      res = "Success";
      return res;
    } catch (e) {
      res = e.toString();
      throw AuthUserLogoutException();
    }
  }

  @override
  Future<String> signUpUser(String email, String password, String bio,
      String username, Uint8List file) async {
    final FirebaseStorage storage = FirebaseStorage.instance;
    final FirebaseFirestore db = FirebaseFirestore.instance;
    try {
      UserCredential user =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      String uid = user.user!.uid;
      TaskSnapshot task =
          await storage.ref().child("Users").child(uid).putData(file);
      String url = await task.ref.getDownloadURL();
      await db.collection("Users").doc(uid).set({
        'username': username,
        'email': email,
        'uid': uid,
        'bio': bio,
        'followers': [],
        'following': [],
        'profilephotourl': url
      });
      return "Success";
    } catch (e) {
      return e.toString();
    }
  }
}
