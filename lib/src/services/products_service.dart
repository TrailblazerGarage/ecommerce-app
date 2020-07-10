import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ecommerceapp/src/models/product_model.dart';

class ProductService {

  /// Firebase REST API https://firebase.google.com/docs/reference/rest/database
  final String _baseUrl = 'https://flutter9dapps.firebaseio.com';

  Future<bool> addProduct( ProductModel product) async {
    final url = '$_baseUrl/products.json';

    final resp = await http.post( url, body: productModelToJson(product) );
    return true;
  }

  Future<List<ProductModel>> getAllProducts() async {
    final url = '$_baseUrl/products.json';
    final resp = await http.get(url);

    /// Firebase REST  API returns a Map<String, Map<String, dynamic>>
    final Map<String, dynamic> decodedData = json.decode(resp.body);

    final List<ProductModel> products = new List();

    if (decodedData == null ) return [];
    
    decodedData.forEach(( id, prod ) {
      final prodTemp = ProductModel.fromJson(prod);
      prodTemp.id = id;

      products.add(prodTemp);
    });

    ///print( products );
    ///print( products[0].id);
    return products;
  }

  Future<int> removeProduct( String id ) async {
    final url = '$_baseUrl/products/$id.json';
    final resp = await http.delete(url);

    return 1;
  }
}