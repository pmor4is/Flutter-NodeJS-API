import 'package:flutter/material.dart';
import 'package:flutter_node_project/services/api.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreateDataState();
}

class _CreateDataState extends State<CreatePage> {
  // Controllers
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var descriptionController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: "Nome"
                ),
              ),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(
                  hintText: "Preço"
                ),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  hintText: "Descrição"
                ),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: (){
                  var data = {
                    "productName": nameController.text,
                    "productPrice": priceController.text,
                    "productDescription": descriptionController.text,
                  };
                  Api.addProduct(data);
                }, 
                child: const Text("Criar dado"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}