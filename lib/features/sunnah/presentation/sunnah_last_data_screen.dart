import 'package:flutter/material.dart';
import 'package:quran_app/features/sunnah/data/model/sunnah_data_model.dart';
import 'package:quran_app/features/sunnah/presentation/sunnah_hadith_container.dart';

class SunnahLastDataScreen extends StatelessWidget {
  final SunnahDataModel data;
  const SunnahLastDataScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: data.data.fold(
      (left) => ListView(
        children: [
          SunnahHadithContainer(
            hadith: left,
            explain: data.explain,
          ),
        ],
      ),
      (right) => ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return SunnahHadithContainer(
            hadith: right[index]['Text'],
            explain: right[index]['Type'],
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: right.length,
      ),
    ));
  }
}
