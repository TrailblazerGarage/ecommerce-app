import 'package:ecommerceapp/src/bloc/provider.dart';
import 'package:ecommerceapp/src/models/product_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsBloc = Provider.productsBloc(context);
    productsBloc.loadProducts();

    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: _showProductList(productsBloc),
      floatingActionButton: _createButton(context),
    );
  }

  _createButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.deepPurple,
      onPressed: () => Navigator.pushNamed(context, 'product'),
    );
  }

  Widget _showProductList(ProductsBloc productsBloc) {
    return StreamBuilder(
      stream: productsBloc.productsStream,
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
        if (snapshot.hasData) {
          final products = snapshot.data;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, i) =>
                _createItem(context, productsBloc, products[i]),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  /// Draw individual widget of product item inside the ProductList
  Widget _createItem(
      BuildContext context, ProductsBloc productsBloc, ProductModel product) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(color: Colors.deepPurple),
      onDismissed: (direction) => productsBloc.removeProducts(product.id),
      child: Card(
          child: Column(
        children: <Widget>[
          (product.photoUrl == null)
              ? Image(image: AssetImage('assets/no-image.png'))
              : FadeInImage(
                  image: NetworkImage(product.photoUrl),
                  placeholder: AssetImage('assets/jar-loading.gif'),
                  height: 300.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
          ListTile(
            title: Text('${product.title} - ${product.price}'),
            subtitle: Text(product.id),
            onTap: () =>
                Navigator.pushNamed(context, 'product', arguments: product),
          ),
        ],
      )),
    );
  }
}
