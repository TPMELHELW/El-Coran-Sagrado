import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/features/sunnah/controller/sunnah_controller.dart';
import 'package:quran_app/features/sunnah/presentation/primary_list_tile.dart';
import 'package:quran_app/features/sunnah/presentation/sunnah_last_data_screen.dart';

class SunnahJsonDataScreen extends StatelessWidget {
  const SunnahJsonDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SunnahController controller = SunnahController.instance;
    return Scaffold(
      body: ListView.builder(
        itemCount: controller.sunnahJsonData.length,
        itemBuilder: (context, index) {
          return PrimaryListTile(
            itemNumber: index + 1,
            es: controller.sunnahJsonData[index].head,
            ar: '',
            isSaved: false,
            onTap: () {
              Get.to(() => SunnahLastDataScreen(
                    data: controller.sunnahJsonData[index],
                  ));
            },
          );
        },
      ),
    );
  }
}
