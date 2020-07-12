import 'dart:async';

import 'package:ecommerceapp/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  /// RxDart does not know StreamController by BehaviourSubject - no need to .broadcast()
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // Recovery values from Stream
  Stream<String> get emailStream =>
      _emailController.stream.transform(validateEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validatePassword);

  /// Rx.combineLatest
  Stream<bool> get formValidStream =>
      Rx.combineLatest2(emailStream, passwordStream, (email, pass) => true);

  // Insert values to the Stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // Obtain the last value inserted into the streams
  String get email => _emailController.value;
  String get password => _passwordController.value;

  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}
