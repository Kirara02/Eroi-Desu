// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/constant.dart';
import '../../../config/theme/colors.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: UIColors.white,
                    width: 1,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/noir.jpg',
                    width: 48,
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good Morning,',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: UIColors.grey_40,
                      fontSize: AppConstants.kFontSizeS,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Kirara Bernstein',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: UIColors.grey_40,
                      fontSize: AppConstants.kFontSizeXL,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: const Icon(
                    CupertinoIcons.search,
                    color: UIColors.white,
                    size: 28,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
