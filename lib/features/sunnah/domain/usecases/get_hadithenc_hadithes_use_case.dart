import 'package:dartz/dartz.dart';
import 'package:quran_app/core/errors/failures.dart';
import 'package:quran_app/features/sunnah/data/model/sunnah_data_model.dart';
import 'package:quran_app/features/sunnah/domain/repository/hadith_repo.dart';

class GetHadithencHadithesUseCase {
  final HadithRepo _hadithRepo;

  GetHadithencHadithesUseCase({required HadithRepo hadithRepo})
      : _hadithRepo = hadithRepo;

  Future<Either<Failure, List<SunnahDataModel>>> call(String path) async {
    return await _hadithRepo.getSunnah(path);
  }
}
