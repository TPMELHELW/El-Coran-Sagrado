import 'package:flutter/material.dart';
import 'package:quran_app/core/helper/copy_clipboard.dart';

class CopyButton extends StatelessWidget {
  const CopyButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.copy_outlined),
      onPressed: () async {
        copyToClipboard(text);
      },
    );
  }
}
