import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _createBackground(context),
          _loginForm(context),
        ],
      )
    );
  }

  Widget _loginForm(context) {

    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[

          SafeArea(
            child: Container (
              height: 180.0,
            ),
          ),

          Container(
            width: size.width * 0.85,
            padding: EdgeInsets.symmetric(vertical: 50.0),
            margin: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0
                )
              ]
            ),
            child: Column(
              children: <Widget>[
                Text('LogIn', style: TextStyle(fontSize: 20.0)),
                SizedBox( height: 60.0 ),
                _createEmail(),
                SizedBox( height: 30.0 ),
                _createPassword(),
                SizedBox( height: 10.0 ),
                _createLoginButton()
              ],
            ),
          ),

          Text('Forgot Password?'),
          SizedBox( height: 100.0 )
        ]
      )
    );
  }

  Widget _createPassword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),

      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.alternate_email,color: Colors.deepPurple),
          labelText: 'Password',
        ),
      ),
    );
  }

  Widget _createEmail() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),

      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.lock,color: Colors.deepPurple),
          hintText: 'ejemplo@email.com',
          labelText: 'Email',
        ),
      ),
    );
  }

  Widget _createLoginButton() {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
        child: Text('LogIn'),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)
      ),
      elevation: 0.0,
      color: Colors.deepPurple,
      textColor: Colors.white,
      onPressed: (){},
    );
  }

  Widget _createBackground(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final headBackground =  Container(
        height: size.height * 0.4,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: <Color> [
                  Color.fromRGBO(63, 63, 156, 1.0),
                  Color.fromRGBO(90, 70, 178, 1.0)
                ]
            )
        )
    );

    final circle = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.00),
        color: Color.fromRGBO(255, 255, 255, 0.05)
      ),
    );

    return Stack(
      children: <Widget>[
        headBackground,
        Positioned( top: 90.0, left: 30.0, child: circle ),
        Positioned( top: -40.0, left: -30.0, child: circle ),
        Positioned( top: -50.0, left: -10.0, child: circle ),
        Positioned( top: 120.0, left: 20.0, child: circle ),
        Positioned( top: -50.0, left: -20.0, child: circle ),

        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: <Widget>[
              Icon( Icons.person_pin_circle, color: Colors.white, size: 100.0),
              SizedBox( height: 10.0, width: double.infinity ),
              Text('Trailblazers', style: TextStyle( color: Colors.white, fontSize: 25.0))
            ]
          )
        )
      ],
    );
  }
}
