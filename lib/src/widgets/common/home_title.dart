// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../../config/constant.dart';
import '../../config/theme/colors.dart';

class HomeTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  const HomeTitle({
    Key? key,
    required this.title,
    required this.subtitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: AppConstants.kFontSizeXL,
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              subtitle,
              style: const TextStyle(
                color: UIColors.grey_60,
                fontSize: AppConstants.kFontSizeS,
                fontWeight: FontWeight.w300,
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: onTap,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
                child: Row(
                  children: [
                    Text(
                      'Show More',
                      style: TextStyle(color: UIColors.grey_60, fontSize: 13.0),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: UIColors.grey_20,
                      size: 26,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
