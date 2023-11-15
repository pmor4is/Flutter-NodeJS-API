import 'package:flutter/material.dart';
import 'package:flutter_node_project/models/product_model.dart';
import 'package:flutter_node_project/services/api.dart';

class FetchData extends StatelessWidget {
  const FetchData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: Api.getProduct(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {

            List<Product> productsData = snapshot.data;

            return ListView.builder(
              itemCount: productsData.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(Icons.storage),
                  title: Text("${productsData[index].name}"),
                  subtitle: Text("${productsData[index].description}"),
                  trailing: Text("\$  ${productsData[index].price}"),
                );
              },
            );
          }
        },
      ),
    );
  }
}
