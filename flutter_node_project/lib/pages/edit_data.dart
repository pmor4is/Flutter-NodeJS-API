import 'package:flutter/material.dart';
import 'package:flutter_node_project/models/product_model.dart';
import 'package:flutter_node_project/services/api.dart';

class EditData extends StatefulWidget {
  final Product data;
  const EditData({super.key, required this.data});

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.data.name.toString();
    priceController.text = widget.data.price.toString();
    descriptionController.text = widget.data.description.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(hintText: "Nome"),
              ),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(hintText: "Preço"),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(hintText: "Descrição"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Api.updateProduct(widget.data.id,{
                    "productName": nameController.text,
                    "productDescription": descriptionController.text,
                    "productPrice": priceController.text,
                    "id": widget.data.id,
                  });
                },
                child: const Text("Updated"),
              )
            ],
          ),
        ));
  }
}
