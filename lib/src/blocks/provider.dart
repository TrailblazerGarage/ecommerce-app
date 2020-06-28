import 'package:ecommerceapp/src/blocks/login_bloc.dart';
export 'package:ecommerceapp/src/blocks/login_bloc.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget{
  final loginBloc = LoginBloc();

   /// Key key of Widget
   /// Widget (Text, Material App, Container)
  Provider({ Key key, Widget child})
    : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;


  static LoginBloc of ( BuildContext context ) {
    /// DEPRECATED return ( context.inheritFromWidgetOfExactType(Provider) as Provider).loginBloc;
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }
}