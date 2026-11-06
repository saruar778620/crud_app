import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class addProductScreen extends StatefulWidget {
  const addProductScreen({super.key});

  @override
  State<addProductScreen> createState() => _addProductScreenState();
}

class _addProductScreenState extends State<addProductScreen> {
  final TextEditingController _nameTEControler = TextEditingController();
  final TextEditingController _UnitPriceTEControler = TextEditingController();
  final TextEditingController _QuantityTEControler = TextEditingController();
  final TextEditingController _TotalPriceTEControler = TextEditingController();
  final TextEditingController _ImageTEControler = TextEditingController();
  final TextEditingController _ProductCode = TextEditingController();

  bool _addNewProductInprogress = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add New Product")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _nameTEControler,
                  decoration: const InputDecoration(
                    hintText: "Name",
                    labelText: "Name",
                  ),
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Write your name";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _UnitPriceTEControler,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Unit Price",
                    labelText: "Unit Price",
                  ),
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Write your Unit Price";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _ProductCode,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: "Product Code",
                    labelText: "Product Code",
                  ),
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Write your Product Code";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _QuantityTEControler,
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Write your Quantity";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Quantity",
                    labelText: "Quantity",
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _TotalPriceTEControler,
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Write your Total Price";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Total Price",
                    labelText: "Total Price",
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _ImageTEControler,
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Write your Image";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Image",
                    labelText: "Image",
                  ),
                ),
                SizedBox(height: 10),

                Visibility(
                  visible: _addNewProductInprogress== false,
                    replacement: const Center(
                      child: CircularProgressIndicator(),
                    ) ,
                    child:    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _addProduct();
                        }
                      },
                      child: Text("Add"),
                    ),)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _addProduct() async {
    _addNewProductInprogress = true;
    setState(() {});
    const String _addProductUrl =
        'https://crud.teamrabbil.com/api/v1/CreateProduct';

    Map<String, dynamic> _inputData = {
      "imag": _ImageTEControler.text.trim(),
      "ProductCode": _ProductCode.text,
      "ProductName": _nameTEControler.text,
      "Qty": _QuantityTEControler.text,
      "TotalPrice": _TotalPriceTEControler.text,
      "UnitPrice": _UnitPriceTEControler.text,
    };


    Uri uri = Uri.parse(_addProductUrl);
    Response response = await post(
      uri,
      body: jsonEncode(_inputData),
      headers: {'content-type': 'application/json'},
    );
    print(response.statusCode);
    print(response.body);
    print(response.headers);

    _addNewProductInprogress = false;
    setState(() {});

    if(response.statusCode == 200){
      _nameTEControler.clear();
      _UnitPriceTEControler.clear();
      _QuantityTEControler.clear();
      _TotalPriceTEControler.clear();
      _ImageTEControler.clear();
      _ProductCode.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("New product added!"))
      );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Add new product failed! Try again"))
      );
    }
  }

  @override
  void dispose() {
    _nameTEControler.dispose();
    _UnitPriceTEControler.dispose();
    _QuantityTEControler.dispose();
    _TotalPriceTEControler.dispose();
    _ImageTEControler.dispose();
    _ProductCode.dispose();
    super.dispose();
  }
}
