import 'package:flutter/material.dart';

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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add New Product")),
      body: Padding(
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
                validator: (String? value){
                  if(value == null || value.trim().isEmpty){
                    return "Write your name";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _UnitPriceTEControler,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Unit Price",
                  labelText: "Unit Price",
                ),
                validator: (String? value){
                  if(value == null || value.trim().isEmpty){
                    return "Write your Unit Price";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _QuantityTEControler,
                validator: (String? value){
                  if(value == null || value.trim().isEmpty){
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
              SizedBox(height: 10),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _TotalPriceTEControler,
                validator: (String? value){
                  if(value == null || value.trim().isEmpty){
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
              SizedBox(height: 10),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _ImageTEControler,
                validator: (String? value){
                  if(value == null || value.trim().isEmpty){
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
              ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()){

                  }
                },
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
