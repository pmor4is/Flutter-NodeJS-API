import 'package:flutter/material.dart';
import 'package:flutter_node_project/pages/create_page.dart';
import 'package:flutter_node_project/pages/delete_page.dart';
import 'package:flutter_node_project/pages/read_page.dart';
import 'package:flutter_node_project/pages/update_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("CREATE"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CreatePage()));
              },
            ),
            const SizedBox(height: 12,),
            ElevatedButton(
              child: const Text("READ"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FetchData()));
              },
            ),
            const SizedBox(height: 12,),
            ElevatedButton(
              child: const Text("UPDATE"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const UpdatePage()));
              },
            ),
            const SizedBox(height: 12,),
            ElevatedButton(
              child: const Text("DELETE"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DeletePage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
