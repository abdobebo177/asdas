import 'package:flutter/material.dart';
import 'package:flutter_project1/constans/app_constants.dart';

class ShowAverage extends StatelessWidget {
  final double average;
  final int numberofLessons;

  const ShowAverage(
      {required this.numberofLessons, required this.average, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          numberofLessons > 0
              ? '$numberofLessons  Lesson Entered'
              : '  Choose ',
          style: Constants.showAverageBodyStyle,
        ),
        Text(
          average >= 0 ? '${average.toStringAsFixed(2)}' : '0.0',
          style: TextStyle(
              fontSize: 45, fontWeight: FontWeight.w800, color: Colors.purple),
        ),
        Text(
          'Average',
          style: Constants.showAverageBodyStyle,
        ),
      ],
    );
  }
}
