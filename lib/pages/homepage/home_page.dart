import 'package:flutter/material.dart';
import 'package:product_db/helper/product_helper.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home Page"),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Provider.of<productHelper>(context, listen: false);
                },
                icon: const Icon(Icons.favorite),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://i.pinimg.com/564x/91/30/1e/91301e021772ca64535ef10172e6b7b4.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16),
        ),
      ),
    );
  }
}
