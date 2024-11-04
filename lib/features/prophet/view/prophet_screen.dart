import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/constant/app_colors.dart';
import 'package:quran_app/features/prophet/controller/prophet_controller.dart';
import 'package:quran_app/features/prophet/view/custom_appbar.dart';
import 'package:quran_app/features/quran/presentation/quran_screen/widgets/quran_screen_widgets/primary_shimmer.dart';
import 'prophet_course_Screen.dart';

class ProphetScreen extends StatelessWidget {
  const ProphetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProphetController controller = Get.put(ProphetController());
    return DefaultTabController(
      length: 2,
      child: Obx(() => controller.isLoading.value
          ? Scaffold(
              appBar: CustomAppbar(title: 'Mahl', tabs: const [
                Tab(
                  text: '',
                ),
                Tab(text: ''),
              ]),
              body: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                shrinkWrap: true,
                itemBuilder: (context, index) => PrimaryShimmer.rectangle(
                  height: Get.height * 0.09,
                  color: AppColors.kGreenColor,
                  border: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
                itemCount: 8,
              ),
            )
          : Scaffold(
              appBar: CustomAppbar(
                title: '',
                tabs: controller.tabs,
              ),
              backgroundColor: AppColors.kWhiteColor,
              body: TabBarView(
                children: [
                  ProphetCourseScreen(index: 0),
                  ProphetCourseScreen(index: 1)
                ],
              ),
            )),
    );
  }
}
