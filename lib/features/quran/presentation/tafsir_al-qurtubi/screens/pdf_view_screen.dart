import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PdfViewScreen extends StatelessWidget {
  final String path;
  const PdfViewScreen({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    final SharedPreferences shared = Get.find();
    final pdfPinchController = PdfControllerPinch(
        document: PdfDocument.openAsset(path),
        initialPage: shared.getInt(path) ?? 1);
    return Scaffold(
      body: PdfViewPinch(
        onPageChanged: (int index) {
          shared.setInt(path, index);
        },
        controller: pdfPinchController,
      ),
    );
  }
}
