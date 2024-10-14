import 'package:get/get.dart';
import 'package:quran_app/features/quran/presentation/home_screen/home_screen.dart';
import 'package:quran_app/features/quran/controller/quran_controller.dart';

class SplashController extends GetxController {
  final QuranController controller = QuranController.instance;

  @override
  void onInit() async {
    await Future.wait([controller.getSurahs()]).then((value) {
      Get.offAll(
        () => const HomeScreen(),
      );
    });
    super.onInit();
  }
}
