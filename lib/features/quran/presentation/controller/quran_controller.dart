import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:quran_app/core/constant/app_enums.dart';
import 'package:quran_app/core/helper/get_state_from_failure.dart';
import 'package:quran_app/features/quran/domain/entities/ayah_entity.dart';
import 'package:quran_app/features/quran/domain/entities/surah_entity.dart';
import 'package:quran_app/features/quran/domain/usecases/get_surahs_use_case.dart';
import 'package:get/get.dart';

class QuranController extends GetxController {
  static QuranController get instance => Get.find<QuranController>();
  // Data
  List<Surah> surahs = [];
  List<Ayah> resultAyat = [];
  List<Ayah> currentAyat = [];

  // States
  StateType getSurahsState = StateType.init;
  StateType searchAboutAyahState = StateType.init;

  // Primitive
  String validationMessage = '';
  var selectedTafsirs = [].obs;

  int chapterNumber = 1;
  var isSearching = false.obs;
  var searchResults = <Map<String, dynamic>>[].obs;

  var searchController = TextEditingController().obs;

  int currentSurrah = 1;

  Future<void> getSurahs() async {
    getSurahsState = StateType.loading;
    update();
    GetSurahsUseCase getSurahsUseCase = GetSurahsUseCase(Get.find());
    var result = await getSurahsUseCase();
    result.fold(
      (l) async {
        getSurahsState = getStateFromFailure(l);
        validationMessage = l.message;
        log('falied');
        update();
        await Future.delayed(const Duration(milliseconds: 50));
        getSurahsState = StateType.init;
      },
      (r) {
        getSurahsState = StateType.success;
        surahs = r;
        log('success');

        print(surahs);
        // log(surahs[0].ayat[0].noorinternationallatin);
        update();
      },
    );
  }

  Future<void> searchAboutAyah(String query) async {
    searchAboutAyahState = StateType.loading;
    update();
    resultAyat = [];
    for (var surah in surahs) {
      resultAyat = surah.ayat
          .where(
            (element) => element.arabic.contains(query),
          )
          .toList();
    }
    searchAboutAyahState = StateType.success;
    update();
  }

  bool isMultiCopyEnabled = false;

  List<String> multiCopySelectedAyat = [];

  updateMultiCopySelection(String aya) {
    if (multiCopySelectedAyat.contains(aya)) {
      multiCopySelectedAyat.remove(aya);
    } else {
      multiCopySelectedAyat.add(aya);
    }
    update();
  }

  Future<void> updateMultiCopyState() async {
    //selecting multicopy ayat
    if (isMultiCopyEnabled == true) {
      var data = ClipboardData(text: multiCopySelectedAyat.join('\n'));
      await Clipboard.setData(data);

      multiCopySelectedAyat.clear();
      isMultiCopyEnabled = false;
    } else {
      isMultiCopyEnabled = true;
    }
    update();
  }

  bool isPlaying = false;
  int currentPlayingIndex = 0;

  void updatePlayState(bool state) {
    isPlaying = state;
    update();
  }

  void updateCurrentPlayingState(int current) {
    currentPlayingIndex = current;
    scrollController.animateTo((currentPlayingIndex * 150),
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    update();
  }

  ScrollController scrollController = ScrollController();

  bool isAyaPlaying(int index) {
    return currentPlayingIndex + 1 == index && isPlaying;
  }

  void updateSelectedTranslator(List<String> selection) {
    selectedTafsirs.value = selection;
    Get.back();
  }

  void search(String query) {
    isSearching.value = query.isNotEmpty;
    searchResults.clear();
    // if (query.isEmpty) {
    //   return;
    // }
    searchController.value.text = query;
    print(searchController.value.text);
    for (var surah in surahs) {
      for (var ayat in surah.ayat) {
        if (ayat.arabic_search.contains(query)) {
          searchResults.add({
            'sora': surah.name,
            'ayat': ayat,
          });
        }
      }
    }
    update();
  }
}
