import 'package:flutter/material.dart';
import 'package:todo_application/Update_product_screen.dart';
import 'package:todo_application/add_product_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ProductList")),
      body: ListView.separated(
        itemCount: 5,

        itemBuilder: (context, index) {
          return _buildProductItem();
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => addProductScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  ListTile _buildProductItem() {
    return ListTile(
      title: Text("Product Name"),
      subtitle: Wrap(
        children: [
          Text("Unit Price: 100  "),
          Text("Quantity: 100  "),
          Text("Total Price: 10000"),
        ],
      ),
      trailing: Wrap(
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UpdateProductScreen()),
              );
            },
            icon: Icon(Icons.edit),
          ),
          IconButton(onPressed: () {
            _showDeleteConfiirmationDialog();
          }, icon: Icon(Icons.delete_outline_sharp)),
        ],
      ),
    );
  }
  void _showDeleteConfiirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Delete",),
          content: Text("Are you sure that you want to delete this product",),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("cancel"),
              ),
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text("Yes"),
              )
          ],
        );
      },
    );
  }
}


