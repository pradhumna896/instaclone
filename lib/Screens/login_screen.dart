import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newinstagram/Resources/auth_method.dart';
import 'package:newinstagram/Screens/home_screen.dart';
import 'package:newinstagram/Screens/sign_up.dart';
import 'package:newinstagram/Utils/colors.dart';
import 'package:newinstagram/Widget/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
  }
  void loginUser()async {
     String res =await AuthMethods().loginUser(
                      email: _emailController.text,
                      password: _passController.text);
    if(res=='success'){
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
    }                  
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
              const SizedBox(
                height: 64,
              ),
              CustomTextFieldInput(
                  controller: _emailController,
                  hintText: "Enter Email",
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
              InkWell(
                onTap:loginUser,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Text(
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
                    child: const Text("Don't have an Account?"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => SignUpScreen()));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        "Sign Up",
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
