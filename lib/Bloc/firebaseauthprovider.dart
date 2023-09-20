// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutterclone/Bloc/auth_provider.dart';
// import 'package:flutterclone/Bloc/auth_user.dart';

// import '../firebase_options.dart';

// // class FirebaseAuthProvider implements AuthProvider {
// //   @override
// //   Future<void> initialize() async {
// //     await Firebase.initializeApp(
// //       options: DefaultFirebaseOptions.currentPlatform,
// //     );
// //   }

//   // @override
//   // Future<AuthUser> login(
//   //     {required String email, required String password}) async {
//   //   try {
//   //     await FirebaseAuth.instance.signInWithEmailAndPassword(
//   //       email: email,
//   //       password: password,
//   //     );
//   //   } catch (e) {}
//   // }

//   @override
//   AuthUser? get currentUser {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       return AuthUser.fromFirebase(user);
//     } else {
//       return null;
//     }
//   }
// }
