import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterclone/utils/imagepicker.dart';
import 'package:flutterclone/utils/showsnackbar.dart';
import 'package:image_picker/image_picker.dart';

import '../controller/textinput.dart';
import '../resources/auth_methods.dart';
import '../utils/storage.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController biocontroller = TextEditingController();
  Uint8List? img;
  bool _isLoading = false;

  void pickImage() async {
    Uint8List im = await IMGPicker(ImageSource.camera);
    setState(() {
      img = im;
    });

    @override
    void initState() {
      emailController = TextEditingController();
      passwordController = TextEditingController();
      nameController = TextEditingController();
      biocontroller = TextEditingController();
      super.initState();
    }

    @override
    void dispose() {
      emailController.dispose();
      passwordController.dispose();
      nameController.dispose();
      biocontroller.dispose();
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
      child: Column(
        children: [
          //Flexible(flex: 1, child: Container()),
          Stack(
            children: [
              img != null
                  ? CircleAvatar(
                      maxRadius: 200,
                      minRadius: 100,
                      backgroundImage: MemoryImage(img!))
                  : const CircleAvatar(
                      maxRadius: 200,
                      minRadius: 100,
                      backgroundImage: NetworkImage(
                          "https://newprofilepic.photo-cdn.net//assets/images/article/profile.jpg?90af0c8"),
                    ),
              Positioned(
                bottom: 0,
                right: 0,
                child: IconButton(
                  onPressed: () {
                    pickImage();
                  },
                  icon: const Icon(Icons.add_a_photo),
                ),
              ),
            ],
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
            hintText: 'Name',
            controller: nameController,
            isPass: false,
            keyboardType: TextInputType.text,
          ),
          const SizedBox(
            height: 20,
          ),
          TextInputField(
            hintText: 'Bio',
            controller: biocontroller,
            isPass: false,
            keyboardType: TextInputType.number,
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
          ElevatedButton(
            onPressed: () async {
              setState(() {
                _isLoading = true;
              });
              String res = await AuthMethods().signUpUser(
                  bio: biocontroller.text,
                  email: emailController.text,
                  password: passwordController.text,
                  username: nameController.text,
                  profilePhoto: img!);
              biocontroller.clear();
              emailController.clear();
              passwordController.clear();
              nameController.clear();

              setState(() {
                _isLoading = false;
              });
              showSnackbar(res, context);
              //show dialog screen
              print(res);
            },
            child: _isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const Text('Register'),
          ),
          //Flexible(flex: 1, child: Container()),
        ],
      ),
    )));
  }

  Widget LoginErrorDialog(
      {required BuildContext context,
      required String title,
      required String content}) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("OK"))
      ],
    );
  }
}
