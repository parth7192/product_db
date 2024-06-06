import 'package:flutter/material.dart';
import 'package:product_db/routes/app_routes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushNamed(
          context,
          AppRoutes.instance.intropage,
        );
      },
    );

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
      // body: Center(
      //   child: Image(
      //     image: AssetImage(
      //       "lib/assets/logo/logo.gif",
      //     ),
      //   ),
      // ),
    );
  }
}
