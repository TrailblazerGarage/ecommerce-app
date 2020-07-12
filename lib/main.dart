import 'package:ecommerceapp/src/bloc/provider.dart';
import 'package:ecommerceapp/src/pages/home_page.dart';
import 'package:ecommerceapp/src/pages/login_page.dart';
import 'package:ecommerceapp/src/pages/product_page.dart';
import 'package:ecommerceapp/src/pages/register_page.dart';
import 'package:ecommerceapp/src/preferences/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ecommerce App',
        initialRoute: 'login',
        routes: {
          'login'     : ( BuildContext context ) => LoginPage(),
          'register'  : ( BuildContext context ) => RegisterPage(),
          'home'      : ( BuildContext context ) => HomePage(),
          'product'    : ( BuildContext context ) => ProductPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple
        )
      ),
    );
  }
}
