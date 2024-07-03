import 'package:quran_app/core/constant/app_colors.dart';
import 'package:quran_app/features/quran/domain/entities/surah_entity.dart';
import 'package:quran_app/features/quran/presentation/controller/quran_controller.dart';
import 'package:quran_app/features/quran/presentation/widgets/quran_screen_widgets/handle_states_widget.dart';
import 'package:quran_app/features/quran/presentation/widgets/quran_screen_widgets/primary_shimmer.dart';
import 'package:quran_app/features/quran/presentation/widgets/quran_screen_widgets/soura_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SurahSelectSliver extends StatelessWidget {
  final List<Surah> surahs;

  const SurahSelectSliver({
    required this.surahs,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GetBuilder<QuranController>(
        builder: (controller) => SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: AppColors.kPrimaryColor,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: AppColors.kWhiteColor,
                        ),
                        child: HandleStatesWidget(
                          stateType: controller.getSurahsState,
                          hasShimmer: true,
                          shimmerChild: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                PrimaryShimmer.rectangle(
                              height: Get.height * 0.09,
                              color: AppColors.kGreenColor,
                              border: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 15,
                            ),
                            itemCount: 8,
                          ),
                          child: Column(children: [
                            const SizedBox(
                              height: 10,
                            ),
                            ...List.generate(
                              controller.surahs.length,
                              (index) => SouraItem(
                                souraNumber: index + 1,
                                souraName: controller.surahs[index].name,
                                isSaved: false,
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
