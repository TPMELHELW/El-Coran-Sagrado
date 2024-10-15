import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/constant/app_enums.dart';
import 'package:quran_app/features/sunnah/controller/sunnah_controller.dart';
import 'package:quran_app/features/sunnah/hadith_bindings.dart';
import 'package:quran_app/features/sunnah/presentation/custom_item_card.dart';

class BodySunnahScreen extends StatelessWidget {
  const BodySunnahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HadithBindings().dependencies();
    return Scaffold(
      body: GetBuilder<SunnahController>(
          init: SunnahController.instance,
          builder: (controller) {
            return controller.stateType == StateType.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: controller.sunnahData.length,
                    itemBuilder: (context, index) {
                      return CustomItemCard(
                        titleSite: controller.sunnahData[index].title,
                        subtitle: controller.sunnahData[index].subTitle,
                        onPress: () async =>
                            await controller.selectSection(index),
                      );
                    });
          }),
    );
  }
}
