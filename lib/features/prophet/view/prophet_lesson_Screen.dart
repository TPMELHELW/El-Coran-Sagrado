import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/constant/app_colors.dart';
import 'package:quran_app/core/constant/text_styles.dart';
import 'package:quran_app/features/prophet/controller/prophet_controller.dart';
import 'package:quran_app/features/prophet/view/copy_button.dart';

class ProphetLessonScreen extends StatelessWidget {
  final int courseIndex;
  final int lessonIndex;
  const ProphetLessonScreen(
      {required this.courseIndex, required this.lessonIndex, super.key});
  @override
  Widget build(BuildContext context) {
    ProphetController prophetController = Get.find();
    return Scaffold(
      appBar: AppBar(
          title: Text(
              '${prophetController.prophetModel.courses![courseIndex].lessons![lessonIndex].title}'),
          actions: [
            CopyButton(
                text: prophetController.prophetModel.courses![courseIndex]
                    .lessons![lessonIndex].body
                    .toString()),
          ]),
      body: Container(
        color: AppColors.kPrimaryColor,
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
                child: Text(
              '${prophetController.prophetModel.courses![courseIndex].lessons![lessonIndex].body}',
              style: Styles.textStyle18Golden,
            ))),
      ),
    );
  }
}
