import 'package:flutter/material.dart';

class CreateData extends StatefulWidget {
  const CreateData({super.key});

  @override
  State<CreateData> createState() => _CreateDataState();
}

class _CreateDataState extends State<CreateData> {
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
              ElevatedButton(onPressed: (){}, child: const Text("Criar dado"))
            ],
          ),
        ),
      ),
    );
  }
}