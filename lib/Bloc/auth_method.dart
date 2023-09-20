import 'dart:typed_data';
import 'package:flutterclone/Bloc/auth_provider.dart';
import 'package:flutterclone/Bloc/auth_user.dart';
import 'firebaseauthprovider.dart';

class AuthMethod implements AuthProvider {
  final FirebaseAuthProvider provider = FirebaseAuthProvider();

  @override
  Future<void> initialize() async {
    provider.initialize();
  }

  @override
  Future<AuthUser?> login(String email, String password) async {
    AuthUser? user = await provider.login(email, password);
    return user;
  }

  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<String> signUpUser(String email, String password, String bio,
      String username, Uint8List file) {
    return provider.signUpUser(email, password, bio, username, file);
  }
}
