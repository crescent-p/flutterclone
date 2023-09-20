import 'package:firebase_auth/firebase_auth.dart';

class AuthUser {
  final String uid;
  final String email;
  final String? displayName;
  final String? photoUrl;

  AuthUser(
      {required this.uid,
      required this.email,
      this.displayName,
      this.photoUrl});

  factory AuthUser.fromFirebase(User user) {
    return AuthUser(
      uid: user.uid,
      email: user.email!,
      displayName: user.displayName,
      photoUrl: user.photoURL,
    );
  }
}
