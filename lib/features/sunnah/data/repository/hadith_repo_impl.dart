import 'package:dartz/dartz.dart';
import 'package:quran_app/core/errors/failures.dart';
import 'package:quran_app/core/helper/get_failure_from_exception.dart';
import 'package:quran_app/features/sunnah/domain/repository/hadith_repo.dart';
import 'package:quran_app/features/sunnah/data/data_source/hadith_local_data_source.dart';
import 'package:quran_app/features/sunnah/data/model/sunnah_data_model.dart';

class HadithRepoImpl implements HadithRepo {
  final HadithLocalDataSource hadithLocalDataSource;

  const HadithRepoImpl({
    required this.hadithLocalDataSource,
  });

  @override
  Future<Either<Failure, List<SunnahDataModel>>> getSunnah(String path) async {
    try {
      List<SunnahDataModel> sunnahData =
          await hadithLocalDataSource.getSunnah(path);
      return Right(sunnahData);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }

  // @override
  // Future<Either<Failure, HaditencHadithModel>> getHadithencHadithes() async {
  //   try {
  //     Get.find<Logger>().i("Start `getHadithes` in |HadithRepoImpl|");
  //     var hadithes = await hadithLocalDataSource.getHadithencHadithes();
  //     Get.find<Logger>().w("End `getHadithes` in |HadithRepoImpl| $hadithes");
  //     return Right(hadithes);
  //   } catch (e) {
  //     Get.find<Logger>().e(
  //         "End `getHadithes` in |HadithRepoImpl| Exception: ${e.runtimeType}");
  //     return Left(getFailureFromException(e));
  //   }
  // }
}
