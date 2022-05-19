import 'package:flutter/material.dart';
import 'package:flutter_project1/constans/app_constants.dart';
import 'package:flutter_project1/helper/data_helper.dart';

class LetterDropDown extends StatefulWidget {
  final Function onLetterSelected;
  const LetterDropDown({required this.onLetterSelected, Key? key})
      : super(key: key);

  @override
  State<LetterDropDown> createState() => _LetterDropDownState();
}

class _LetterDropDownState extends State<LetterDropDown> {
  double selectedLetterValue = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Constants.dropDownPadding,
      decoration: BoxDecoration(
          color: Constants.mainColor.shade100.withOpacity(0.3),
          borderRadius: Constants.borderRadius),
      child: DropdownButton<double>(
        value: selectedLetterValue,
        elevation: 16,
        iconEnabledColor: Constants.mainColor.shade200,
        onChanged: (value) {
          setState(() {
            selectedLetterValue = value!;
            widget.onLetterSelected(selectedLetterValue);
          });
        },
        underline: Container(),
        items: DataHelper.lettersOfAllLessons(),
      ),
    );
  }
}
