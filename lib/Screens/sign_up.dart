import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newinstagram/Resources/auth_method.dart';
import 'package:newinstagram/Screens/login_screen.dart';
import 'package:newinstagram/Utils/colors.dart';
import 'package:newinstagram/Utils/utils.dart';
import 'package:newinstagram/Widget/text_field_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _bioController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  Uint8List? _image;
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
    _bioController.dispose();
    _userNameController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Column(
            children: [
              Flexible(child: Container()),
              SvgPicture.asset("assets/ic_instagram.svg", color: primaryColor),
              SizedBox(
                height: 64,
              ),
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 50,
                          backgroundImage: MemoryImage(_image!),
                        )
                      :const CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                              "http://www.shadowsphotography.co/wp-content/uploads/2017/12/photography-01-800x400.jpg"),
                        ),
                  Positioned(
                      bottom: -10,
                      right: 0,
                      child: IconButton(
                          onPressed: selectImage,
                          icon: Icon(Icons.add_a_photo)))
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              CustomTextFieldInput(
                  controller: _userNameController,
                  hintText: "Enter your username",
                  keyBoardType: TextInputType.emailAddress),
              const SizedBox(
                height: 15,
              ),
              CustomTextFieldInput(
                  controller: _emailController,
                  hintText: "Enter your email",
                  keyBoardType: TextInputType.emailAddress),
              const SizedBox(
                height: 15,
              ),
              CustomTextFieldInput(
                  isObs: true,
                  controller: _passController,
                  hintText: "Enter Password",
                  keyBoardType: TextInputType.emailAddress),
              const SizedBox(
                height: 15,
              ),
              CustomTextFieldInput(
                  controller: _bioController,
                  hintText: "Enter your bio",
                  keyBoardType: TextInputType.emailAddress),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: (() async {
                  String res = await AuthMethods().signUpUser(file: _image!,
                      email: _emailController.text,
                      password: _passController.text,
                      userName: _userNameController.text,
                      bio: _bioController.text);
                  print(res);
                }),
                child: Container(
                  width: double.infinity,
                  padding:const EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                  decoration:const BoxDecoration(color: Colors.blue),
                  child:const Text(
                    "Login",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Flexible(child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child:const Text("Have not an Account?"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: ((context) =>LoginScreen() )));
                    },
                    child: Container(
                      padding:const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        "Log in",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
