// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/common/comic_card.dart';
import '../../../widgets/common/home_title.dart';
import '../bloc/home_bloc.dart';

class UpdateMangaHome extends StatefulWidget {
  const UpdateMangaHome({Key? key}) : super(key: key);

  @override
  State<UpdateMangaHome> createState() => _UpdateMangaHomeState();
}

class _UpdateMangaHomeState extends State<UpdateMangaHome> {
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
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeFailed) {
                print(state.e);
              }
              if (state is HomeSucces) {
                return LayoutBuilder(
                  builder: (context, constraint) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
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
                      ),
                    );
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
