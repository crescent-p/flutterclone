import 'dart:typed_data';
import 'auth_user.dart';

abstract class AuthProvider {
  Future<void> initialize();
  AuthUser? get currentUser;
  Future<AuthUser?> login(String email, String password);
  Future<String> signUpUser(String email, String password, String bio,
      String username, Uint8List file);
}
