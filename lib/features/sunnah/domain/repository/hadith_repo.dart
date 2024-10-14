import 'package:dartz/dartz.dart';
import 'package:quran_app/core/errors/failures.dart';
import 'package:quran_app/features/sunnah/data/model/sunnah_data_model.dart';

abstract class HadithRepo {
  Future<Either<Failure, List<SunnahDataModel>>> getSunnah(String path);
}
