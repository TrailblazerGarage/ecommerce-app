import 'package:flutter/material.dart';
import 'package:ecommerceapp/src/utils/utils.dart' as utils;

class ProductPage extends StatefulWidget {

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  final formKey = GlobalKey<FormState>();

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
      textCapitalization:TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Product'
      ),
      validator: (value) {
        return (value.length < 3) ? 'Add product name' : null;
      },
    );
  }

  Widget _addPrice(){
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Price'
      ),
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

    print('Data is correct');
  }

}
