import 'package:flutter/material.dart';
import 'package:flutter_project1/constans/app_constants.dart';
import 'package:flutter_project1/helper/data_helper.dart';

class CreditDropDown extends StatefulWidget {
  final Function onCreditSelected;
  const CreditDropDown({required this.onCreditSelected, Key? key})
      : super(key: key);

  @override
  State<CreditDropDown> createState() => _CreditDropDownState();
}

class _CreditDropDownState extends State<CreditDropDown> {
  double selectedCreditValue = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Constants.dropDownPadding,
      decoration: BoxDecoration(
          color: Constants.mainColor.shade100.withOpacity(0.3),
          borderRadius: Constants.borderRadius),
      child: DropdownButton<double>(
        value: selectedCreditValue,
        elevation: 16,
        iconEnabledColor: Constants.mainColor.shade200,
        onChanged: (value) {
          setState(() {
            selectedCreditValue = value!;
            widget.onCreditSelected(value);
          });
        },
        underline: Container(),
        items: DataHelper.creditsOfAllLessons(),
      ),
    );
  }
}
