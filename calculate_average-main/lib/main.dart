import 'package:flutter/material.dart';
import 'package:flutter_project1/constans/app_constants.dart';
import 'package:flutter_project1/widget/calculate_averagepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculate Dynamic Average',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Constants
              .mainColor, //primarycolorda ana rengi belirtirken kullanılıyor.Swatch ise ona uygun diğer renkleri de tanımlıyor..
          visualDensity: VisualDensity
              .adaptivePlatformDensity //ortama uygun şekilde görünmesini sağladım.
          ),
      home: const CalculateAveragePage(),
    );
  }
}
