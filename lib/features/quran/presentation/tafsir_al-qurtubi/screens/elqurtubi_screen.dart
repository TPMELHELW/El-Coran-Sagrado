import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/features/quran/controller/quran_controller.dart';
import 'package:quran_app/features/quran/presentation/tafsir_al-qurtubi/screens/pdf_view_screen.dart';

class AlqurtubiScreen extends StatelessWidget {
  const AlqurtubiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final QuranController controller = QuranController.instance;
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemCount: controller.booksData.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Get.to(() =>
                    PdfViewScreen(path: controller.booksData[index].path));
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: const Color(0xff2A2C41),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/quran.png',
                      height: 100,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.booksData[index].title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            controller.booksData[index].subTitle,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
