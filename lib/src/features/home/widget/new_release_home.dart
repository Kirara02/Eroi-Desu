// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:eroi_desu/src/config/constant.dart';
import 'package:eroi_desu/src/config/screen.dart';
import 'package:eroi_desu/src/config/theme/colors.dart';
import 'package:eroi_desu/src/widgets/common/home_title.dart';
import 'package:flutter/material.dart';

class NewReleaseHome extends StatefulWidget {
  const NewReleaseHome({Key? key}) : super(key: key);

  @override
  State<NewReleaseHome> createState() => _NewReleaseHomeState();
}

class _NewReleaseHomeState extends State<NewReleaseHome> {
  CarouselController controller = CarouselController();
  int currentCarousel = 0;

  List<Map<String, dynamic>> data = [
    {
      'judul': 'Overlord',
      'genre': ['Action', 'Adventure'],
      'sinopsis':
          'The final hour of the popular virtual reality game Yggdrasil has come. However, Momonga, a powerful wizard and master of the dark guild Ainz Ooal Gown, decides to spend his',
      'img_url': 'assets/images/overlord.jpg',
    },
    {
      'judul': 'Eigty Six',
      'genre': ['Military', 'Mecha'],
      'sinopsis':
          'Discrimination, privilege, pride and unlikely bonds form the basis of Eighty-Six. The story revolves around the French-coded nation of San Magnolia, a state which, cornered in its war effort, ',
      'img_url': 'assets/images/86.jpeg',
    },
    {
      'judul': 'Attack on Titan',
      'genre': ['Military', 'Tragedi', 'Thiller'],
      'sinopsis':
          'One day, 10 year old Eren and his childhood friend Mikasa witness something horrific as the city walls are destroyed by a colossal titan that appears out of thin air. ',
      'img_url': 'assets/images/aot.jpg',
    },
  ];

  Widget buildCarouselItem(Map<String, dynamic> anime) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  anime['judul'].toString().toUpperCase(),
                  style: const TextStyle(
                    fontSize: AppConstants.kFontSizeXL,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2.0),
                Text(
                  anime['genre'].join(', '),
                  style: TextStyle(
                    fontSize: AppConstants.kFontSizeS,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Synopsis',
                  style: TextStyle(
                    fontSize: AppConstants.kFontSizeS,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  anime['sinopsis'],
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 5.0),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: UIColors.white, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            width: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                anime['img_url'].toString(),
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeTitle(
            title: 'New Release!',
            subtitle: 'Read the latest comik recommendations',
            onTap: () {},
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/bg.jpg",
                  fit: BoxFit.cover,
                  width: AppScreens.width,
                  height: 200,
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    width: AppScreens.width,
                    height: 200,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
                CarouselSlider(
                  carouselController: controller,
                  options: CarouselOptions(
                    height: 200,
                    aspectRatio: 16 / 9,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: false,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentCarousel = index;
                      });
                    },
                  ),
                  items: data.map((anime) {
                    return buildCarouselItem(anime);
                  }).toList(),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Row(
                    children: data.asMap().entries.map((entry) {
                      final index = entry.key;
                      return Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            width: currentCarousel == index ? 20 : 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: currentCarousel == index
                                  ? AppColors.biru1
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
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
