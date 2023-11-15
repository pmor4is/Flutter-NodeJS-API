import 'package:flutter/material.dart';
import 'package:flutter_node_project/models/product_model.dart';
import 'package:flutter_node_project/pages/edit_data.dart';
import 'package:flutter_node_project/services/api.dart';

class UpdatePage extends StatelessWidget {
  const UpdatePage({super.key});

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
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => EditData(data: productData[index]),
                        )
                      );
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
