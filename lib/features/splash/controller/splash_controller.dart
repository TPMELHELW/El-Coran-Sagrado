import 'package:get/get.dart';
import 'package:quran_app/features/quran/presentation/controller/quran_controller.dart';
import 'package:quran_app/features/quran/presentation/screens/quran_screen.dart';

class SplashController extends GetxController {
  final QuranController controller = QuranController.instance;

  @override
  void onInit() async {
    await Future.wait([controller.getSurahs()]).then((value) {
      Get.offAll(
        () => const QuranScreen(),
      );
      // normaliseFun();
    });
    super.onInit();
  }
}
