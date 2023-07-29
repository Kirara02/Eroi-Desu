// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:eroi_desu/src/features/list_comic/bloc/comic_bloc.dart';
import 'package:eroi_desu/src/features/list_comic/view/list_comic_page.dart';
import 'package:eroi_desu/src/widgets/common/comic_card.dart';
import 'package:eroi_desu/src/widgets/common/home_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../bloc/home_bloc.dart';

class MostPopularHome extends StatefulWidget {
  const MostPopularHome({Key? key}) : super(key: key);

  @override
  State<MostPopularHome> createState() => _MostPopularHomeState();
}

class _MostPopularHomeState extends State<MostPopularHome> {
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
            title: "Most Popular Comics",
            subtitle: "Lots of interesting comics here",
            onTap: () {
              pushDynamicScreen(context,
                  screen: PageTransition(
                    child: const ListComicPage(),
                    type: PageTransitionType.rightToLeft,
                  ),
                  withNavBar: false);
            },
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeFailed) {
                print(state.e);
              }
              if (state is HomeSucces) {
                return LayoutBuilder(
                  builder: (context, constraint) {
                    return Wrap(
                      children: List.generate(
                        state.datas.length,
                        (index) {
                          var item = state.datas[index];

                          var size = constraint.biggest.width / 3;

                          return SizedBox(
                            width: size,
                            height: 180,
                            child: ComicCard(
                              comic: item,
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              }
              return const SizedBox(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
