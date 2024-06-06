import 'package:flutter/material.dart';
import 'package:product_db/pages/detailpage/detail_page.dart';
import 'package:product_db/pages/homepage/home_page.dart';
import 'package:product_db/pages/intro_page/intro_page.dart';
import 'package:product_db/pages/loginpage/login_page.dart';
import 'package:product_db/pages/signuppage/signup_page.dart';
import 'package:product_db/pages/splashscreen/splash_screen.dart';

class AppRoutes {
  AppRoutes._();
  static final AppRoutes instance = AppRoutes._();
  String splashscreen = '/';
  String homepage = 'home_page';
  String detailpage = 'detail_page';
  String intropage = 'intro_page';
  String signuppage = 'signup_page';
  String loginpage = 'login_page';

  Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const SplashScreen(),
    'home_page': (context) => const HomePage(),
    'detail_page': (context) => const DetailPage(),
    'intro_page': (context) => const IntroPage(),
    'signup_page': (context) => const SignupPage(),
    'login_page': (context) => const LoginPage(),
  };
}
