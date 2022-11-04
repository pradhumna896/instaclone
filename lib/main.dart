import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newinstagram/Screens/login_screen.dart';
import 'package:newinstagram/Screens/sign_up.dart';
import 'package:newinstagram/Utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "Instagram-clone",
      options: const FirebaseOptions(
          apiKey: "AIzaSyDiX2m46ul_QBz-7rK2Yw0t23N3n10H36A",
          appId: "1:623847755341:web:788d3833650994936ed604",
          messagingSenderId: "623847755341",
          projectId: "instagram-clone-7ad31"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instagram Clone',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        // home: const ResponsiveLayout(
        //     webScreenLayout: webScreenLayout(),
        //     mobileScreenLayout: MobileScreenLayout()),
        home: const SignUpScreen());
  }
}
