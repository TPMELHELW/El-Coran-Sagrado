import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran_app/features/sunnah/data/model/sunnah_data_model.dart';

abstract class HadithLocalDataSource {
  Future<List<SunnahDataModel>> getSunnah(String path);
}

class HadithLocalDataSourceImpl extends HadithLocalDataSource {
  @override
  Future<List<SunnahDataModel>> getSunnah(String path) async {
    try {
      String file = await rootBundle.loadString(path);
      List data = json.decode(file);
      final ref =
          data.map((element) => SunnahDataModel.fromjson(element)).toList();
      return ref;
    } catch (e) {
      rethrow;
    }
  }
}
