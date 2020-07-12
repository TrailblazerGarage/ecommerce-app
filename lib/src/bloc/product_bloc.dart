import 'dart:io';

import 'package:ecommerceapp/src/services/product_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ecommerceapp/src/models/product_model.dart';

class ProductsBloc {
  final _productsController = new BehaviorSubject<List<ProductModel>>();
  final _loadingController = new BehaviorSubject<bool>();

  final _productsService = new ProductService();

  Stream<List<ProductModel>> get productsStream => _productsController.stream;
  Stream<bool> get loading => _loadingController.stream;

  void loadProducts() async {
    final products = await _productsService.getAllProducts();
    _productsController.sink.add(products);
  }

  void addProducts(ProductModel product) async {
    _loadingController.sink.add(true);
    await _productsService.addProduct(product);
    _loadingController.sink.add(false);
  }

  Future<String> uploadProductImage(PickedFile productImage) async {
    _loadingController.sink.add(true);
    final productImageUrl = await _productsService.uploadImage(productImage);
    _loadingController.sink.add(false);
    return productImageUrl;
  }

  void editProducts(ProductModel product) async {
    _loadingController.sink.add(true);
    await _productsService.editProduct(product);
    _loadingController.sink.add(false);
  }

  void removeProducts(String id) async {
    await _productsService.removeProduct(id);
  }

  dispose() {
    _productsController?.close();
    _loadingController?.close();
  }
}
