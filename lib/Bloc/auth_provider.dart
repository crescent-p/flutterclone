import 'package:firebase_auth/firebase_auth.dart';

import 'auth_user.dart';

abstract class AuthProvider {
  Future<void> initialize();
  AuthUser? get currentUser;
  Future<AuthUser> login(String email, String password);
}
