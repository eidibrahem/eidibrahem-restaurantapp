import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/fish/fish_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,


      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      appBarTheme:AppBarTheme(
       color: Colors.black87,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness:Brightness.dark,
        ),

        elevation: 0.0,


      ) ,

        primarySwatch: Colors.blue,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,

        ),
      ),
      home: FishLayout() ,
    );
  }
}
