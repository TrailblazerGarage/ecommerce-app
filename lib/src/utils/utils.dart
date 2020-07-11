import 'package:flutter/material.dart';

bool isNumeric( String input) {
  if (input.isEmpty ) return false;

  final inputParsedAsNumber = num.tryParse(input);
  return ( inputParsedAsNumber == null ) ? false : true;
}

void showAlert(BuildContext context, String message) {
  showDialog(
      context: context,
      builder: ( context ) {
        return AlertDialog(
          title: Text('Information is not correct'),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      }
  );
}