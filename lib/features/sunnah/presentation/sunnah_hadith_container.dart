import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_app/core/constant/text_styles.dart';
import 'package:quran_app/features/sunnah/presentation/hadith_arabic_container.dart';

class SunnahHadithContainer extends StatelessWidget {
  final String hadith, explain;

  const SunnahHadithContainer(
      {required this.hadith, super.key, required this.explain});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        HadithArabicContainer(hadithArabic: hadith),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 12),
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width - 70),
              child: Text(
                explain,
                style: Styles.textStyle18Black,
                textDirection: TextDirection.ltr,
              ),
            ),
            InkWell(
                onTap: () async {
                  var data = ClipboardData(text: explain);
                  await Clipboard.setData(data);
                },
                child: Icon(Icons.copy)),
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
