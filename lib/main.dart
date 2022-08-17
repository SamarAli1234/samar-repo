import 'package:flutter/material.dart';
import 'package:ssssssss/SplashScreen.dart';
import 'package:ssssssss/XOboard.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
         XoBoard.RoutName:(_)=>XoBoard(),
        Splash.RouteName:(_)=>Splash()
      },
      initialRoute: Splash.RouteName ,
    );
  }
}

