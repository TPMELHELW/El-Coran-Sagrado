import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/features/quran/controller/quran_controller.dart';
import 'package:quran_app/features/quran/presentation/home_screen/info_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final QuranController controller = QuranController.instance;
    return Scaffold(
      backgroundColor: const Color(0xff2A2C41),
      body: ListView(
        children: [
          Stack(children: [
            Image.memory(controller.imageData.value!),
            Positioned(
              right: 10,
              child: IconButton(
                alignment: Alignment.centerRight,
                onPressed: () => Get.to(() => const InfoScreen()),
                icon: const Icon(
                  Icons.info_outline,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ]),
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFbac2b9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...List.generate(
                  controller.itemsData.length,
                  (index) => GestureDetector(
                    onTap: controller.itemsData[index].onPress,
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
                                  controller.itemsData[index].title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white),
                                  maxLines: 2,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  controller.itemsData[index].subTitle,
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
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
