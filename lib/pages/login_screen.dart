import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterclone/controller/textinput.dart';
import 'package:flutterclone/realBloc/auth_event.dart';
import '../realBloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //adds spacing between the top of the screen and the widgets
            Flexible(flex: 1, child: Container()),
            SvgPicture.asset(
              'images/login.svg',
              height: 200,
            ),
            const Text(
              'Login',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            TextInputField(
              hintText: 'E-mail',
              controller: emailController,
              isPass: false,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 20,
            ),
            TextInputField(
              hintText: 'Password',
              controller: passwordController,
              isPass: true,
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _isLoading = true;
                });
                context.read<AuthBloc>().add(AuthEventLogin(
                      email: emailController.text,
                      password: passwordController.text,
                    ));
                setState(() {
                  _isLoading = false;
                });
                emailController.clear();
                passwordController.clear();
              },
              child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator()
                      : const Text("Sign In")),
            ),
            const SizedBox(
              height: 20,
            ),
            Flexible(flex: 1, child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: const Text('Don\'t have an account?'),
                  onTap: () {},
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Register'),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  void signInPerson(BuildContext context) async {}
}
