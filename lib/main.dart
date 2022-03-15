import 'package:dinamik_ortalma_hesapla/constants/constants.dart';
import 'package:dinamik_ortalma_hesapla/widgets/ortalama_hesaplama_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dinamik Not Hesaplama',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      
      primarySwatch: Sabitler.anarenk,
      visualDensity: VisualDensity.adaptivePlatformDensity,      ),
      home: OrtalamaHesaplaPage(),
    );
  }
}

