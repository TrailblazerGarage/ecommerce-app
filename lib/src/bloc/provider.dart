import 'package:flutter/material.dart';

import 'package:ecommerceapp/src/bloc/login_bloc.dart';
import 'package:ecommerceapp/src/bloc/product_bloc.dart';

export 'package:ecommerceapp/src/bloc/login_bloc.dart';
export 'package:ecommerceapp/src/bloc/product_bloc.dart';

class Provider extends InheritedWidget {
  final _loginBloc = new LoginBloc();
  final _productsBloc = new ProductsBloc();
  static Provider _instance;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  factory Provider({Key key, Widget child}) {
    if (_instance == null) {
      _instance = new Provider._internal(key: key, child: child);
    }
    return _instance;
  }

  /// Key key of Widget
  /// Widget (Text, Material App, Container)
  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  /// Look up on InheritedWidget tree for LoginBloc Widget
  static LoginBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()._loginBloc;
  }

  static ProductsBloc productsBloc(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()._productsBloc;
  }
}
