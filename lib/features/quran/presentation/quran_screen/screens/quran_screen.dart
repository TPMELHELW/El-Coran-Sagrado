import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/constant/text_styles.dart';
import 'package:quran_app/features/quran/domain/entities/surah_entity.dart';
import 'package:quran_app/features/quran/controller/quran_controller.dart';
import 'package:quran_app/features/quran/presentation/quran_screen/screens/search_screen.dart';
import 'package:quran_app/features/quran/presentation/quran_screen/screens/surah_screen.dart';
import 'package:quran_app/features/quran/presentation/quran_screen/widgets/quran_screen_widgets/soura_select_sliver_context.dart';

class QuranScreen extends GetView<QuranController> {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff2A2C41),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Quran',
          style: Styles.textStyle18Godlen,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () => Get.to(() => const SearchScreen()),
          ),
        ],
        elevation: 0,
      ),
      body: SurahSelectSliver(surahs: controller.surahs),
    );
  }
}

class SearchResultWidget extends StatelessWidget {
  final Map<String, dynamic> searchResult;

  const SearchResultWidget({super.key, required this.searchResult});

  @override
  Widget build(BuildContext context) {
    final QuranController controller = QuranController.instance;
    int findSoraIndex(List<Surah> soras, String soraValue) {
      for (int i = 0; i < soras.length; i++) {
        if (soras[i].name == soraValue) {
          return i;
        }
      }
      return -1; // Return -1 if the sora is not found
    }

    int getAyahIndex(Surah surah, String searchText) {
      return surah.ayat.indexWhere(
          (ayah) => ayah.arabic.contains(searchResult['ayat'].arabic));
    }

    return InkWell(
      onTap: () {
        var surahIndex = findSoraIndex(
          controller.surahs,
          searchResult['sora'],
        );
        controller.currentSurrah = surahIndex + 1;
        controller.currentAyat = controller.surahs[surahIndex].ayat;

        var ayahIndex = getAyahIndex(
            controller.surahs[findSoraIndex(
              controller.surahs,
              searchResult['sora'],
            )],
            searchResult['ayat'].arabic);

        Get.to(() => SurahScreen(
              ayaNumber: ayahIndex + 1,
            ));
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${searchResult['sora']}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                searchResult['ayat'].arabic,
                style: const TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
