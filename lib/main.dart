import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterclone/Bloc/auth_method.dart';
import 'package:flutterclone/pages/home_screen.dart';
import 'package:flutterclone/pages/login_screen.dart';
import 'package:flutterclone/realBloc/auth_bloc.dart';
import 'package:flutterclone/realBloc/auth_event.dart';
import 'package:flutterclone/realBloc/auth_state.dart';
import 'firebase_options.dart';

void main() async {
  //ensures the flutter widgets are loaded before firebase is initialized
  WidgetsFlutterBinding.ensureInitialized();

  //initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(AuthMethod()),
        child: const LoginScreen(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const AuthEventInitialize());
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is AuthStateLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is AuthStateLoggedIn) {
          return const HomeScreen();
        }
        if (state is AuthStateLoggedOut) {
          return const HomeScreen();
        } else {
          return const Center(child: Text("Error"));
        }
      },
    );
  }
}
