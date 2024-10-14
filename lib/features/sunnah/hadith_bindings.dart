import 'package:get/get.dart';
import 'package:quran_app/features/sunnah/controller/sunnah_controller.dart';
import 'package:quran_app/features/sunnah/data/data_source/hadith_local_data_source.dart';
import 'package:quran_app/features/sunnah/data/repository/hadith_repo_impl.dart';
import 'package:quran_app/features/sunnah/domain/repository/hadith_repo.dart';

class HadithBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<HadithLocalDataSource>(
      HadithLocalDataSourceImpl(),
    );
    Get.put<HadithRepo>(
      HadithRepoImpl(
        hadithLocalDataSource: Get.find(),
      ),
    );

    Get.put(SunnahController());
  }
}
