// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../../../widgets/common/comic_card.dart';
import '../../../widgets/common/home_title.dart';

class UpdateMangaHome extends StatefulWidget {
  const UpdateMangaHome({Key? key}) : super(key: key);

  @override
  State<UpdateMangaHome> createState() => _UpdateMangaHomeState();
}

class _UpdateMangaHomeState extends State<UpdateMangaHome> {
  List<Map<String, dynamic>> animeData = [
    {
      'title': 'Attack on Titan',
      'genre': ['Action', 'Fantasy'],
      'img_url': 'assets/images/aot.jpg',
    },
    {
      'title': 'Naruto',
      'genre': ['Action', 'Adventure'],
      'img_url': 'assets/images/naruto.jpg',
    },
    {
      'title': 'One Piece',
      'genre': ['Action', 'Adventure', 'Fantasy'],
      'img_url': 'assets/images/op.jpg',
    },
    {
      'title': 'Demon Slayer',
      'genre': ['Action', 'Supernatural'],
      'img_url': 'assets/images/kny.jpg',
    },
    {
      'title': 'Death Note',
      'genre': ['Supernatural', 'Suspense'],
      'img_url': 'assets/images/dn.jpg',
    },
    {
      'title': 'Sword Art Online',
      'genre': ['Action', 'Adventure', 'Fantasy'],
      'img_url': 'assets/images/sao.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeTitle(
            title: "Update Manga",
            subtitle: "Don't miss this week's update",
            onTap: () {},
          ),
          LayoutBuilder(
            builder: (context, constraint) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    animeData.length,
                    (index) {
                      var item = animeData[index];

                      var size = constraint.biggest.width / 3;

                      return SizedBox(
                        width: size,
                        height: 180,
                        child: ComicCard(
                          title: item['title'],
                          genre: List<String>.from(item['genre']),
                          imgUrl: item['img_url'],
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
