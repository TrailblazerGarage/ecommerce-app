import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ecommerceapp/src/models/product_model.dart';

class ProductProvider {

  /// Firebase REST API https://firebase.google.com/docs/reference/rest/database
  final String _baseUrl = 'https://flutter9dapps.firebaseio.com';

  Future<bool> addProduct( ProductModel product) async {
    final url = '$_baseUrl/products.json';

    final resp = await http.post( url, body: productModelToJson(product) );
    final decodeData = json.decode(resp.body);
    print( decodeData );

    return true;
  }

}