// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eroi_desu/src/data/models/chapter_model.dart';
import 'package:eroi_desu/src/data/models/comic_model.dart';
import 'package:eroi_desu/src/features/comic_chapter/bloc/comic_chapter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComicChapterPage extends StatefulWidget {
  final ComicModel comic;
  final ChapterModel chapter;
  const ComicChapterPage({Key? key, required this.comic, required this.chapter})
      : super(key: key);

  @override
  State<ComicChapterPage> createState() => _ComicChapterPageState();
}

class _ComicChapterPageState extends State<ComicChapterPage> {
  @override
  void initState() {
    super.initState();
    context
        .read<ComicChapterBloc>()
        .add(GetImageChapterEvent(widget.chapter.id!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          centerTitle: false,
          title: Text(
            '${widget.comic.title!} - ${widget.chapter.chapter!}',
            maxLines: 2,
          ),
          actions: const [],
        ),
      ),
      body: BlocBuilder<ComicChapterBloc, ComicChapterState>(
        builder: (context, state) {
          if (state is ComicChapterSuccess) {
            return ListView.builder(
              itemCount: state.datas.length,
              itemBuilder: (context, index) {
                return CachedNetworkImage(
                  imageUrl: state.datas[index].url!,
                  fit: BoxFit.fitHeight,
                );
              },
            );
          }

          if (state is ComicChapterFailed) {
            print(state.e);
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
