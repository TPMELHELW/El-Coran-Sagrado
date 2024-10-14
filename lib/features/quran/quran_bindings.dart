import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quran_app/core/helper/network_info.dart';
import 'package:quran_app/features/quran/data/data_sources/ayat_audio_remote_source.dart';
import 'package:quran_app/features/quran/data/data_sources/quran_local_data_source.dart';
import 'package:quran_app/features/quran/data/data_sources/quran_remote_data_source.dart';
import 'package:quran_app/features/quran/data/repository/quran_repo_impl.dart';
import 'package:quran_app/features/quran/domain/repository/quran_repo.dart';
import 'package:quran_app/features/quran/controller/quran_controller.dart';
import 'package:get/get.dart';
import 'package:quran_app/services/api_services.dart';
import 'package:http/http.dart' as http;
import 'package:quran_app/services/shared_preferences_service.dart';

class QuranBindings extends Bindings {
  @override
  dependencies() async {
    Get.put(InternetConnectionChecker());
    Get.put(SharedPreferencesService(pref: Get.find()));

    Get.put<NetworkInfo>(NetworkInfoImpl(Get.find()));
    Get.put(
      ApiService(
        client: http.Client(),
        networkInfo: Get.find(),
      ),
    );
    Get.put<QuranRemoteDataSource>(
      QuranRemoteDataSourceImpl(apiService: Get.find()),
    );
    Get.put<QuranLocalDataSource>(
      QuranLocalDataSourceImpl(),
    );
    Get.put<QuranRepo>(
      QuranRepoImpl(
        quranRemoteDataSource: Get.find(),
        quranLocalDataSource: Get.find(),
      ),
    );
    Get.put<AyatAudioRemoteDataSource>(
      AyatAudioRemoteDataSourceImpl(apiService: Get.find()),
    );

    Get.put(QuranController());
    // Get.put(AudioService());
    // Get.put(SurahController());
  }
}
