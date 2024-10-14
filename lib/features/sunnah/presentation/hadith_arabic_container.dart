import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/constant/app_colors.dart';
import 'package:quran_app/core/constant/text_styles.dart';

class HadithArabicContainer extends StatelessWidget {
  final String hadithArabic;
  const HadithArabicContainer({
    required this.hadithArabic,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.kGreenColor,
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: () async {
                var data = ClipboardData(text: hadithArabic);
                await Clipboard.setData(data);
              },
              child: Icon(Icons.copy)),
          SizedBox(
            width: context.width * 0.7,
            child: Container(
              // padding: const EdgeInsets.only(right: 12),
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width - 50),
              child: Text(
                hadithArabic,
                style: Styles.textStyle18Godlen,
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
        ],
      ),

      // AyaText(aya: hadithArabic, ayaNumber: 1),
    );
  }
}
