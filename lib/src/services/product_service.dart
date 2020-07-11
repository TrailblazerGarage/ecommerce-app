import 'dart:convert';

import 'package:ecommerceapp/src/preferences/user_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:ecommerceapp/src/models/product_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime_type/mime_type.dart';
import 'dart:io';

class ProductService {

  /// Firebase REST API https://firebase.google.com/docs/reference/rest/database
  final String _baseUrl = 'https://flutter9dapps.firebaseio.com';
  final _prefs = new UserPreferences();

  Future<bool> addProduct( ProductModel product) async {
    final url = '$_baseUrl/products.json';

    final resp = await http.post( url, body: productModelToJson(product) );
    return true;
  }

  Future<List<ProductModel>> getAllProducts() async {
    final url = '$_baseUrl/products.json?auth${ _prefs.token }';
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

  Future<bool> editProduct( ProductModel product ) async {
    final url = '$_baseUrl/products/${product.id}.json?auth${ _prefs.token }';

    final resp = await http.put( url, body: productModelToJson(product));
    final decodedData = json.decode(resp.body);
    print(decodedData);

    return true;
  }

  Future<int> removeProduct( String id ) async {
    final url = '$_baseUrl/products/$id.json?auth${ _prefs.token }';
    final resp = await http.delete(url);

    return 1;
  }

  Future<String> uploadImage(PickedFile image) async {
    final url = Uri.parse('https://api.cloudinary.com/v1_1/dsk6auln9/image/upload?upload_preset=hj2ad9ki');
    final mimeType = mime(image.path).split('/'); /// image/jpg,png
    final imageUploadRequest = http.MultipartRequest(
        'POST',
        url
    );

    final file = await http.MultipartFile.fromPath(
      'file',
      image.path,
      contentType: MediaType( mimeType[0], mimeType[1] )
    );

    imageUploadRequest.files.add(file);
    /// Iterate and send many files just adding:
    ///imageUploadRequest.files.add(file1);
    ///imageUploadRequest.files.add(file2);
    
    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if ( resp.statusCode != 200 && resp.statusCode != 201 ) {
      print('Not worked correctly');
      print(resp.body);
      return null;
    }

    final respData = json.decode(resp.body);
    print(respData);
    return respData['secure_url'];
  }
}