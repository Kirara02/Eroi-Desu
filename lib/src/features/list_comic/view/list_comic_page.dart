// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:eroi_desu/src/config/screen.dart';
import 'package:eroi_desu/src/features/list_comic/bloc/comic_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/constant.dart';
import '../../../widgets/common/comic_card.dart';

class ListComicPage extends StatefulWidget {
  const ListComicPage({Key? key}) : super(key: key);

  @override
  State<ListComicPage> createState() => _ListComicPageState();
}

class _ListComicPageState extends State<ListComicPage> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<ComicBloc>().add(GetComicPageEvent());
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        context.read<ComicBloc>().add(GetNextComicPageEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "List Comics",
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.search,
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(10.0),
            sliver: BlocBuilder<ComicBloc, ComicState>(
              builder: (context, state) {
                if (state is ComicSuccess) {
                  print(state.datas.length);
                  return SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 3 / 4,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        if (state.isNext && index == state.datas.length) {
                          if (state.isNext && index == state.datas.length) {
                            return SizedBox(
                              width: AppScreens.width,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                        }
                        
                        return ComicCard(
                          comic: state.datas[index],
                        );
                      },
                      childCount: state.isNext
                          ? state.datas.length + 1
                          : state.datas.length,
                    ),
                  );
                }

                if (state is ComicFailed) {
                  print(state.e);
                }

                return const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
