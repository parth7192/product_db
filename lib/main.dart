import 'package:flutter/material.dart';
import 'package:product_db/controller/product_controller.dart';
import 'package:product_db/my_app.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductController(),
        )
      ],
      child: const MyApp(),
    ),
  );
}
