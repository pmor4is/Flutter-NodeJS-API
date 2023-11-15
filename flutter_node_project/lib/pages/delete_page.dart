import 'package:flutter/material.dart';
import 'package:flutter_node_project/models/product_model.dart';
import 'package:flutter_node_project/services/api.dart';

class DeletePage extends StatefulWidget {
  const DeletePage({super.key});

  @override
  State<DeletePage> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update"),
      ),
      body: FutureBuilder(
        future: Api.getProduct(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {

            List<Product> productData = snapshot.data;

            return ListView.builder(
              itemCount: productData.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(Icons.storage),
                  title: Text("${productData[index].name}"),
                  subtitle: Text("${productData[index].description}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      await Api.deleteProduct(productData[index].id);
                      productData.removeAt(index);
                      setState((){});
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
