import 'package:flutter/material.dart';
import 'package:flutter_project1/constans/app_constants.dart';
import 'package:flutter_project1/helper/data_helper.dart';
import 'package:flutter_project1/model/lesson.dart';
import 'package:flutter_project1/widget/credit_dropdownwidget.dart';
import 'package:flutter_project1/widget/lesson_list.dart';
import 'package:flutter_project1/widget/letter_dropdownwidget.dart';
import 'package:flutter_project1/widget/show_average.dart';

class CalculateAveragePage extends StatefulWidget {
  const CalculateAveragePage({Key? key}) : super(key: key);

  @override
  State<CalculateAveragePage> createState() => _CalculateAveragePageState();
}

class _CalculateAveragePageState extends State<CalculateAveragePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  double selectedLetterValue = 4;
  double selectedCreditValue = 1;
  String enteredLessonName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: Text(
              Constants.titleText,
              style: Constants.titleStyle,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildForm(),
                ),
                Expanded(
                  child: ShowAverage(
                    numberofLessons: DataHelper.allAddedLessons.length,
                    average: DataHelper.calculateAverage(),
                  ),
                )
              ],
            ),
            Expanded(
              child: LessonList(
                extracted: (index) {
                  //çıkarılan
                  DataHelper.allAddedLessons.removeAt(index);
                  setState(() {});
                },
              ),
            ),
          ],
        ));
  }

  Widget _buildForm() {
    return Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: Constants.horizontalPadding8,
              child: _buildTextFormField(),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                    child: LetterDropDown(
                      onLetterSelected: (letter) {
                        selectedLetterValue = letter;
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                    child: CreditDropDown(
                      onCreditSelected: (credit) {
                        selectedCreditValue = credit;
                      },
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _addLessonAndCalculateAverage,
                  icon: const Icon(Icons.arrow_forward_ios),
                  color: Constants.mainColor,
                  iconSize: 30,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ));
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (value) {
        setState(() {
          enteredLessonName = value!;
        });
      },
      validator: (s) {
        if (s!.length <= 0) {
          return 'Please enter lesson name';
        } else
          return null;
      },
      decoration: InputDecoration(
          hintText: 'Math',
          border: OutlineInputBorder(
              borderRadius: Constants.borderRadius,
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Constants.mainColor.withOpacity(0.1)),
    );
  }

  void _addLessonAndCalculateAverage() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var lessonToBeAdded = Lesson(
          name: enteredLessonName,
          letterValue: selectedLetterValue,
          creditValue: selectedCreditValue);
      DataHelper.addLesson(lessonToBeAdded);
      setState(() {});
    }
  }
}

//kredi ve harf widgetlerini başka bir widgetin içine(credit and letterdropwdown)
//koydum çünkü programda set state oldugunda sadece o text güncellensin
//yani bütün liste okunmasın ve bütün bu değerler değiştirilmesin diye