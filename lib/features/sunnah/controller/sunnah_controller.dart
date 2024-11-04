import 'package:get/get.dart';
import 'package:quran_app/core/constant/app_enums.dart';
import 'package:quran_app/features/prophet/view/prophet_screen.dart';
import 'package:quran_app/features/sunnah/data/model/sunnah_data_model.dart';
import 'package:quran_app/features/sunnah/data/model/sunnah_item_model.dart';
import 'package:quran_app/features/sunnah/domain/usecases/get_hadithenc_hadithes_use_case.dart';
import 'package:quran_app/features/sunnah/presentation/sunnah_json_data_screen.dart';
import 'package:quran_app/features/sunnah/presentation/sunnah_pdf_data_screen.dart';

class SunnahController extends GetxController {
  static SunnahController get instance => Get.find<SunnahController>();

  List<SunnahDataModel> sunnahJsonData = [];

  Future<void> selectSection(int index) async {
    if (sunnahData[index].extenstion == 'pdf') {
      Get.to(() => SunnahPdfDataScreen(
            path: sunnahData[index].filePath,
          ));
    } else if (sunnahData[index].extenstion == 'screen') {
      Get.to(() => const ProphetScreen());
    } else {
      await getSunnah(sunnahData[index].filePath);
    }
  }

  late StateType stateType;
  Future<void> getSunnah(String path) async {
    stateType = StateType.loading;
    update();
    GetHadithencHadithesUseCase getHadithencHadithesUseCase =
        GetHadithencHadithesUseCase(hadithRepo: Get.find());

    var result = await getHadithencHadithesUseCase(path);
    result.fold(
      (l) {
        stateType = StateType.badRequest;
        update();
      },
      (r) {
        sunnahJsonData = r;
        stateType = StateType.success;
        Get.to(() => const SunnahJsonDataScreen());

        update();
      },
    );
  }
  //  HomeCardData(
  //   title: "Biografía del profeta Muhámmad",
  //   copyRight:
  //       'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
  //   link: '',
  //   description:
  //       "La Sunnah del Profeta y las sectas corruptas que la contradicen",
  //   iconPath: AppSvgs.prophet,
  //   targetScreen: AppPagesRoutes.prophetScreen,
  // ),

  final List<SunnahItemModel> sunnahData = [
    SunnahItemModel(
        title: 'Biografía del profeta Muhámmad',
        subTitle:
            'La Sunnah del Profeta y las sectas corruptas que la contradicen',
        filePath: 'prophet',
        extenstion: 'screen'),
    SunnahItemModel(
        title: 'La importancia de la Sunnah y los hadices en el Islam',
        subTitle:
            'Un libro que explica ,por qué se debe seguir la Sunnah y el peligro de abandonarla.',
        filePath: 'assets/pdf/sunnah.pdf',
        extenstion: 'pdf'),
    SunnahItemModel(
        title: 'Las Cuarenta Nawawíes',
        subTitle: 'Los 40 hadices más famosos de las palabras del Profeta.',
        filePath: 'assets/json/alnawawi.json',
        extenstion: 'json'),
    SunnahItemModel(
        title: 'Hadices Qudsíes',
        subTitle:
            'Hadices que Dios dijo a través de las palabras del Profeta Muhammad.',
        filePath: 'assets/pdf/ahadith.pdf',
        extenstion: 'pdf'),
    SunnahItemModel(
        title: 'Riyad as-Salihin',
        subTitle: 'Un gran número de hadices útiles en varias ramas del Islam.',
        filePath: 'assets/json/ryadelsalheen.json',
        extenstion: 'json'),
    SunnahItemModel(
        title: 'Ar-Rahiq al-Makhtum',
        subTitle:
            'Un libro completo sobre la biografía del Profeta Muhammad, la paz sea con él.',
        filePath: 'assets/pdf/elraheeq.pdf',
        extenstion: 'pdf')
  ];

  @override
  void onInit() {
    stateType = StateType.init;
    super.onInit();
  }
}
