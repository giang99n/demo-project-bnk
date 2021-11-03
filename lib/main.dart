import 'package:demo_manager/configs/colors.dart';
import 'package:demo_manager/routes.dart';
import 'package:flutter/material.dart';

import 'ui/Screens/Welcome/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo project',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
      // navigatorKey: AppNavigator.navigatorKey,
      // onGenerateRoute: AppNavigator.onGenerateRoute,
    );
  }
}
