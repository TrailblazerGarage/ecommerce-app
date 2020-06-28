import 'package:ecommerceapp/src/blocks/login_bloc.dart';
export 'package:ecommerceapp/src/blocks/login_bloc.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget{

  final loginBloc = LoginBloc();
  static Provider _instance;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  factory Provider({ Key key, Widget child }) {

    if ( _instance == null ) {
      _instance = new Provider._internal( key: key, child: child);
    }
    return _instance;
  }

  /// Key key of Widget
  /// Widget (Text, Material App, Container)
  Provider._internal({ Key key, Widget child})
      : super(key: key, child: child);

  static LoginBloc of ( BuildContext context ) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }
}