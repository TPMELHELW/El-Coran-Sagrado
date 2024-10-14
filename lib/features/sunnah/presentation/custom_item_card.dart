// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:quran_app/core/constant/app_colors.dart';
import 'package:quran_app/core/constant/text_styles.dart';

class CustomItemCard extends StatelessWidget {
  final String titleSite;
  final String subtitle;
  final void Function()? onPress;

  const CustomItemCard({
    super.key,
    required this.titleSite,
    this.subtitle = '',
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.kGreenColor,
      child: ListTile(
        onTap: onPress,
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: VerticalDivider(
            thickness: 2,
            color: AppColors.white,
          ),
        ),
        title: Text(
          titleSite,
          style: Styles.textStyle18Godlen,
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Colors.white),
        ),
        // trailing: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     !hasCopyRights
        //         ? Container()
        //         : IconButton(
        //             onPressed: () {
        //               showDialog(
        //                   context: context,
        //                   builder: (BuildContext context) {
        //                     return PubUpCustom(
        //                       body: copyRights,
        //                       link: link,
        //                     );
        //                   });
        //             },
        //             icon: const Icon(
        //               Icons.info,
        //               color: AppColors.white,
        //             )),
        //     Container(
        //       width: 10,
        //     ),
        //     Icon(
        //       icon ?? Icons.arrow_forward_ios,
        //       color: AppColors.white,
        //     )
        //   ],
        // ),
      ),
    );
  }
}
