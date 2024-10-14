import 'package:dartz/dartz.dart';
import 'package:quran_app/core/errors/failures.dart';
import 'package:quran_app/features/quran/domain/entities/surah_entity.dart';

abstract class QuranRepo {
  Future<Either<Failure, List<Surah>>> getSurahs();
}
