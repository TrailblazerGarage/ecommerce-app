import 'package:ecommerceapp/src/models/product_model.dart';
import 'package:ecommerceapp/src/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/src/blocks/provider.dart';

class HomePage extends StatelessWidget {

  final productService = new ProductService();

  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home')
      ),
      body: _showProductList(),
      floatingActionButton: _createButton(context),
    );
  }

  _createButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon( Icons.add ),
      backgroundColor: Colors.deepPurple,
      onPressed: () => Navigator.pushNamed(context, 'product'),
    );
  }

  Widget _showProductList() {
    return FutureBuilder(
      future: productService.getAllProducts(),
      builder: (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
        if ( snapshot.hasData ) {
          final products = snapshot.data;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, i) => _createItem( context, products[i] ),
          );
        } else {
          return Center ( child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _createItem(BuildContext context, ProductModel product ) {
    return Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.deepPurple
        ),
        onDismissed: ( direction ) {
          productService.removeProduct(product.id);
        },
        child: Card(
          child: Column(
            children: <Widget>[
              ( product.photoUrl == null )
              ? Image (image: AssetImage('assets/no-image.png'))
              : FadeInImage(
                image: NetworkImage( product.photoUrl ),
                placeholder: AssetImage('assets/jar-loading.gif'),
                height: 300.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              ListTile(
                title: Text('${ product.title } - ${ product.price }'),
                subtitle: Text( product.id ),
                onTap: () => Navigator.pushNamed(context, 'product', arguments: product ),
              ),
            ],
          )
        ),
    );
  }


}
