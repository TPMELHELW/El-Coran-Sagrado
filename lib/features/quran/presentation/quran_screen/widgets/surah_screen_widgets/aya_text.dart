import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/core/constant/text_styles.dart';
import 'package:quran_app/features/quran/presentation/quran_screen/widgets/surah_screen_widgets/aya_words_widget.dart';

class AyaText extends StatelessWidget {
  const AyaText({
    super.key,
    required this.aya,
    required this.ayaNumber,
    this.textDirection = TextDirection.rtl,
    this.ayaStyle = Styles.textStyle18Godlen,
    this.ayaNumberStyle = Styles.textStyleQuranPageNumber,
  });

  final String aya;
  final int ayaNumber;
  final TextDirection textDirection;
  final TextStyle ayaStyle;
  final TextStyle ayaNumberStyle;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textDirection: textDirection,
      text: TextSpan(
        style: ayaStyle,
        children: [
          TextSpan(text: aya),
        ],
      ),
    );
  }
}

class AyaArabicText extends StatelessWidget {
  const AyaArabicText({
    super.key,
    required this.aya,
    required this.ayaNumber,
    this.textDirection = TextDirection.rtl,
    this.ayaStyle = Styles.textStyle18Godlen,
    this.ayaNumberStyle = Styles.textStyleQuranPageNumber,
  });

  final String aya;
  final int ayaNumber;
  final TextDirection textDirection;
  final TextStyle ayaStyle;
  final TextStyle ayaNumberStyle;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Directionality(
        textDirection: textDirection,
        child: AyaWordsWidget(aya: aya, ayaNumber: ayaNumber),
      ),
    );
  }
}
