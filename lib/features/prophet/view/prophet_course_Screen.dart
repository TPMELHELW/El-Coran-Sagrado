import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/constant/app_colors.dart';
import 'package:quran_app/core/constant/text_styles.dart';
import 'package:quran_app/features/prophet/controller/prophet_controller.dart';
import 'package:quran_app/features/prophet/view/custom_listTile.dart';
import 'prophet_lesson_Screen.dart';

class ProphetCourseScreen extends StatelessWidget {
  final int index;
  const ProphetCourseScreen({required this.index, super.key});
  @override
  Widget build(BuildContext context) {
    ProphetController prophetController = Get.find();
    return Container(
      color: AppColors.kPrimaryColor,
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                    '${prophetController.prophetModel.courses![index].description}',
                    style: Styles.textStyle16Golden,
                    textAlign: TextAlign.center),
                SizedBox(
                  height: context.height * 0.8,
                  child: ListView.builder(
                      itemCount: prophetController
                          .prophetModel.courses![index].lessons!.length,
                      itemBuilder: (context, i) => CustomListTile(
                            index: i,
                            title:
                                '${prophetController.prophetModel.courses![index].lessons![i].title}',
                            onTap: () {
                              Get.to(() => ProphetLessonScreen(
                                  courseIndex: index, lessonIndex: i));
                            },
                          )),
                )
              ],
            ),
          )),
    );
  }
}
