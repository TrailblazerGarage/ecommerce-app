import 'package:ecommerceapp/src/blocks/provider.dart';
import 'package:ecommerceapp/src/pages/home_page.dart';
import 'package:ecommerceapp/src/pages/login_page.dart';
import 'package:ecommerceapp/src/pages/product_page.dart';
import 'package:ecommerceapp/src/pages/register_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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
