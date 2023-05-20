import 'package:ecommerce_app/auth_Screen/auth.dart';
import 'package:ecommerce_app/auth_Screen/login_or_register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screeen/list_product.dart';

import 'auth_Screen/login_page.dart';
import 'auth_Screen/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Screeen/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}
