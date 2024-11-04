import 'package:flutter/material.dart';
import 'package:quran_app/core/constant/app_colors.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        appBar: AppBar(
          backgroundColor: AppColors.kPrimaryColor,
          title: const Text(
            'Developers',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20)),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Eng.Mahmoud Elhelw',
                  style: TextStyle(
                      color: Colors.black, fontSize: 30, fontFamily: 'elhelw'),
                ),
                Text('mahmoudtarekelhelw1234@gmail.com'),
                SelectableText('+201026271039'),
              ],
            ),
          ),
        ));
  }
}
