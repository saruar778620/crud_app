import 'package:flutter/material.dart';

class addProductScreen extends StatefulWidget {
  const addProductScreen({super.key});

  @override
  State<addProductScreen> createState() => _addProductScreenState();
}

class _addProductScreenState extends State<addProductScreen> {
  TextEditingController _nameTEControler = TextEditingController();
  TextEditingController _UnitPriceTEControler = TextEditingController();
  TextEditingController _QuantityTEControler = TextEditingController();
  TextEditingController _TotalPriceTEControler = TextEditingController();
  TextEditingController _ImageTEControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add New Product")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Name",
                  labelText: "Name",
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Unit Price",
                  labelText: "Unit Price",
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Quantity",
                  labelText: "Quantity",
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Total Price",
                  labelText: "Total Price",
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Image",
                  labelText: "Image",
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                child: Text("Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _nameTEControler.dispose();
    _UnitPriceTEControler.dispose();
    _QuantityTEControler.dispose();
    _TotalPriceTEControler.dispose();
    _ImageTEControler.dispose();
    super.dispose();
  }
}
