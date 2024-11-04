import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quran_app/features/quran/controller/quran_controller.dart';
import 'package:quran_app/features/quran/presentation/quran_screen/screens/quran_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuranController controller = QuranController.instance;
    final TextEditingController _searchController =
        controller.searchController.value;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                onChanged: (value) {
                  controller.search(value);
                },
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Obx(
              () => controller.searchResults.isEmpty
                  ? Lottie.asset('assets/json/empty.json')
                  : Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return SearchResultWidget(
                              searchResult: controller.searchResults[index],
                            );
                          }),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
