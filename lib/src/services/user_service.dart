import 'dart:convert';

import 'package:ecommerceapp/src/preferences/user_preferences.dart';
import 'package:http/http.dart' as http;

class UserService {

  // TODO add to general application properties file
  final String _firebaseToken = 'AIzaSyAFvCG6TQ-d8C4paoLV-LhB7LEe9u05Hsw';
  final _prefsUser = new UserPreferences();

  Future<Map<String, dynamic>> login( String email, String password ) async {
    final authData = {
      'email'             : email,
      'password'          : password,
      'returnSecureToken' : true
    };

    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken',
      body: json.encode( authData )
    );

    Map<String, dynamic> decodeResp = json.decode( resp.body );
    return _saveTokenToUserPreferences(decodeResp);
  }

  Future<Map<String, dynamic>> newUser( String email, String password ) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final httpResponse = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken',
        body: json.encode(authData));

    Map<String, dynamic> decodeResp = json.decode( httpResponse.body );
    return _saveTokenToUserPreferences(decodeResp);
  }

  _saveTokenToUserPreferences(Map<String, dynamic> response) {
    if ( response.containsKey('idToken')) {
      _prefsUser.token = response['idToken'];
      return { 'ok': true, 'token': response['idToken'] };
    } else {
      return { 'ok': false, 'message': response['error']['message'] };
    }
  }
}