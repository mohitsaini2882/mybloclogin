import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mybloclogin/helpers/local_storage_helper.dart';
import 'package:mybloclogin/ui/create_account.dart';
import 'package:mybloclogin/ui/home_screen.dart';
import 'package:mybloclogin/ui/login_screen.dart';
import 'package:mybloclogin/ui/splash_screen.dart';
import 'package:mybloclogin/ui/user_details.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
       //home: SplashScreen(),
        home: UserDetails()
        //home: CreateAccount(),
      );
  }
}