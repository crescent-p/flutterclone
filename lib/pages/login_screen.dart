import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterclone/controller/textinput.dart';
import 'package:flutterclone/errorDialog/LoginError.dart';
import 'package:flutterclone/pages/register_screen.dart';
import 'package:flutterclone/resources/auth_methods.dart';
import 'package:flutterclone/utils/showsnackbar.dart';

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
              onTap: () => signInPerson(context),
              child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: _isLoading
                      ? CircularProgressIndicator()
                      : Text("Sign In")),
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

  void signInPerson(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signInUser(
      email: emailController.text,
      password: passwordController.text,
    );
    setState(() {
      _isLoading = false;
    });
    if (res == 'Success') {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const RegisterScreen()));
    } else {
      showSnackbar(res, context);
    }
    emailController.clear();
    passwordController.clear();
    showSnackbar(res, context);
  }
}
