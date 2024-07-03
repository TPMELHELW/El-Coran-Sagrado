import 'package:dartz/dartz.dart';
import 'package:quran_app/core/errors/failures.dart';
import 'package:quran_app/core/helper/get_failure_from_exception.dart';
import 'package:quran_app/features/quran/data/data_sources/quran_local_data_source.dart';
import 'package:quran_app/features/quran/data/data_sources/quran_remote_data_source.dart';
import 'package:quran_app/features/quran/domain/entities/surah_entity.dart';
import 'package:quran_app/features/quran/domain/repository/quran_repo.dart';

class QuranRepoImpl implements QuranRepo {
  final QuranRemoteDataSource quranRemoteDataSource;
  final QuranLocalDataSource quranLocalDataSource;

  const QuranRepoImpl({
    required this.quranRemoteDataSource,
    required this.quranLocalDataSource,
  });

  @override
  Future<Either<Failure, List<Surah>>> getSurahs() async {
    try {
      var surahs = await quranLocalDataSource.getSurahs();

      return Right(surahs);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
