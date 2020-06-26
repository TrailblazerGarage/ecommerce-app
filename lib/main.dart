import 'package:ecommerceapp/src/pages/home_page.dart';
import 'package:ecommerceapp/src/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce App',
      initialRoute: 'login',
      routes: {
        'login' : ( BuildContext context ) => LoginPage(),
        'home'  : ( BuildContext context ) => HomePage(),
      },
    );
  }
}
