import 'package:flutter/material.dart';
import 'halaman_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Menu App',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: Colors.orange,
        useMaterial3: true,
      ),
      home: const HalamanLogin(),
      debugShowCheckedModeBanner: false,
    );
  }
}