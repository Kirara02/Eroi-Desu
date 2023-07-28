import 'package:eroi_desu/src/config/theme/colors.dart';
import 'package:eroi_desu/src/features/home/widget/header_home.dart';
import 'package:eroi_desu/src/features/home/widget/most_popular_home.dart';
import 'package:eroi_desu/src/features/home/widget/new_release_home.dart';
import 'package:eroi_desu/src/features/home/widget/update_manga_home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Container(
        padding: const EdgeInsets.only(
          top: 30,
          bottom: 50,
          right: 20,
          left: 20,
        ),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              HeaderHome(),
              NewReleaseHome(),
              MostPopularHome(),
              UpdateMangaHome(),
            ],
          ),
        ),
      ),
    );
  }
}
