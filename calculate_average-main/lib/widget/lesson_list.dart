import 'package:flutter/material.dart';
import 'package:flutter_project1/constans/app_constants.dart';
import 'package:flutter_project1/helper/data_helper.dart';
import 'package:flutter_project1/model/lesson.dart';

class LessonList extends StatelessWidget {
  final Function extracted;
  const LessonList({
    required this.extracted,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Lesson> allLessons = DataHelper.allAddedLessons;
    return allLessons.length > 0
        ? ListView.builder(
            itemCount: allLessons.length,
            itemBuilder: (context, index) {
              return Dismissible(
                //kaydırıp silmek için
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a) {
                  extracted(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(allLessons[index].name),
                      leading: CircleAvatar(
                        backgroundColor: Constants.mainColor,
                        child: Text(
                          (allLessons[index].letterValue *
                                  allLessons[index].creditValue)
                              .toStringAsFixed(0),
                        ),
                      ),
                      subtitle: Text(
                          '${allLessons[index].creditValue} Credit, Grade Value ${allLessons[index].letterValue}'),
                    ),
                  ),
                ),
              );
            })
        : Center(
            child: Container(
              child: Text(
                'Please Add Lessons',
                style: Constants.titleStyle,
              ),
            ),
          );
  }
}
