import 'package:flutter/material.dart';
import 'package:flutter_project1/model/lesson.dart';

class DataHelper {
  //app-related data
  static List<Lesson> allAddedLessons = [];
  static addLesson(Lesson lesson) {
    allAddedLessons.add(lesson);
  }

  static double calculateAverage() {
    double totalGrade = 0;
    double totalCredit = 0;

    allAddedLessons.forEach((element) {
      totalGrade = totalGrade + (element.creditValue * element.letterValue);
      totalCredit += element
          .creditValue; //aldıgı not ve kredi çarpılıyor.Toplam not bulunduktan sonra toplam krediye böldüm.
    });
    return totalGrade / totalCredit;
  }

  // ignore: unused_element
  static List<String> _allLessonLetters() {
    return ['AA', 'BA', 'BB', 'CB', 'CC', 'DC', 'DD', 'FD', 'FF'];
  }

  // ignore: unused_element
  static double _convertLettertoNote(String harf) {
    //harfi nota çevir
    switch (harf) {
      case 'AA':
        return 4;

      case 'BA':
        return 3.5;

      case 'BB':
        return 3.0;

      case 'CB':
        return 2.5;

      case 'CC':
        return 2;

      case 'DC':
        return 1.5;

      case 'DD':
        return 1;

      case 'FD':
        return 0.5;

      case 'FF':
        return 0.0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> lettersOfAllLessons() {
    return _allLessonLetters()
        .map(
          (e) => DropdownMenuItem(
            child: Text(e),
            value: _convertLettertoNote(e),
          ),
        )
        .toList();
  }

  // ignore: unused_element
  static List<int> _allCredits() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> creditsOfAllLessons() {
    return _allCredits()
        .map(
          (e) => DropdownMenuItem(
            child: Text(
              e.toString(),
            ),
            value: e.toDouble(),
          ),
        )
        .toList();
  }
}
