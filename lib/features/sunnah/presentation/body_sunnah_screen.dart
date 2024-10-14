import 'package:flutter/material.dart';
import 'package:quran_app/features/sunnah/controller/sunnah_controller.dart';
import 'package:quran_app/features/sunnah/hadith_bindings.dart';
import 'package:quran_app/features/sunnah/presentation/custom_item_card.dart';

class BodySunnahScreen extends StatelessWidget {
  const BodySunnahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HadithBindings().dependencies();
    final SunnahController controller = SunnahController.instance;
    return Scaffold(
      body: ListView.builder(
          itemCount: controller.sunnahData.length,
          itemBuilder: (context, index) {
            return CustomItemCard(
              titleSite: controller.sunnahData[index].title,
              subtitle: controller.sunnahData[index].subTitle,
              onPress: () async => await controller.selectSection(index),
            );
          }),
    );
  }
}
