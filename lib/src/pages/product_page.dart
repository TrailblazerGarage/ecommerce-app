import 'package:ecommerceapp/src/services/products_service.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/src/models/product_model.dart';
import 'package:ecommerceapp/src/utils/utils.dart' as utils;

class ProductPage extends StatefulWidget {

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  final formKey = GlobalKey<FormState>();
  final productProvider = new ProductService();

  ProductModel product = new ProductModel();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
        actions: <Widget>[
          IconButton(
            icon: Icon( Icons.photo_size_select_actual ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon( Icons.camera_alt ),
            onPressed: () {},
          )
        ]
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _addName(),
                _addPrice(),
                _setProductAvailability(),
                _addConfirmButton()
              ]
            )
          ),
        )
      )
    );
  }

  Widget _addName() {
    return TextFormField(
      initialValue: product.title,
      textCapitalization:TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Product'
      ),
      onSaved: (value) => product.title = value,
      validator: (value) {
        return (value.length < 3) ? 'Add product name' : null;
      },
    );
  }

  Widget _setProductAvailability(){
    return SwitchListTile(
      value: product.available,
      title: Text('Available'),
      activeColor: Colors.deepPurple,
      onChanged: (value) => setState(() {
        product.available = value;
      })
    );
  }

  Widget _addPrice(){
    return TextFormField(
      initialValue: product.price.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Price'
      ),
      onSaved: (value) => product.price = double.parse(value),
      validator: (value) {
        return (utils.isNumeric(value)) ? null : 'Only numbers accepted';
      },
    );
  }

  Widget _addConfirmButton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Colors.deepPurple,
      textColor: Colors.white,
      label: Text('Save'),
      icon: Icon( Icons.save ),
      onPressed: _submit,
    );
  }

  void _submit() {
    if(!formKey.currentState.validate()) return;

    formKey.currentState.save();

    print( product.title);
    print( product.price);
    print( product.available);

    productProvider.addProduct(product);
  }
}
