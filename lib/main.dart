import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newinstagram/Responsive/mobile_screen_layout.dart';

import 'package:newinstagram/Responsive/responsive_layout_screen.dart';
import 'package:newinstagram/Screens/login_screen.dart';
import 'package:newinstagram/Screens/sign_up.dart';
import 'package:newinstagram/Utils/colors.dart';
import 'package:newinstagram/providers/user_provider.dart';
import 'package:provider/provider.dart';

import 'Responsive/web_screen_layout.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>UserProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Instagram Clone',
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: mobileBackgroundColor,
          ),
         
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: ((context, snapshot){
              if(snapshot.connectionState == ConnectionState.active){
                if(snapshot.hasData){
                  return const ResponsiveLayout(
              webScreenLayout: webScreenLayout(),
              mobileScreenLayout: MobileScreenLayout());
                }else if(snapshot.hasError){
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
              }
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(
                  child:  CircularProgressIndicator(
                    color: primaryColor,
                  ),
                );
              }
              return const LoginScreen();
            }),)),
    );
  }
}
