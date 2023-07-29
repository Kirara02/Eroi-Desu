import 'package:eroi_desu/src/config/constant.dart';
import 'package:eroi_desu/src/config/theme/colors.dart';
import 'package:eroi_desu/src/data/models/comic_model.dart';
import 'package:eroi_desu/src/features/comic_detail/bloc/comic_detail_bloc.dart';
import 'package:eroi_desu/src/features/comic_detail/widget/chapter_tile.dart';
import 'package:eroi_desu/src/widgets/images/cached_network.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComicDetailPage extends StatefulWidget {
  final ComicModel comic;

  const ComicDetailPage({
    super.key,
    required this.comic,
  });

  @override
  State<ComicDetailPage> createState() => _ComicDetailPageState();
}

class _ComicDetailPageState extends State<ComicDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<ComicDetailBloc>().add(GetComicChapterEvent(widget.comic.id!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.ellipsis_vertical,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 50,
            right: 20,
            left: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 120,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: UIColors.white,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: UICacheNetworkImage(
                          imageUrl: widget.comic.cover!,
                          fit: BoxFit.cover,
                          size: const Size.fromWidth(100),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.comic.title!,
                                maxLines: 3,
                                style: const TextStyle(
                                  fontSize: AppConstants.kFontSizeL,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'By: ${widget.comic.author}',
                                style: const TextStyle(
                                  fontSize: AppConstants.kFontSizeS,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: UIColors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              widget.comic.jenis!,
                              style: const TextStyle(
                                color: UIColors.text,
                                fontWeight: FontWeight.w500,
                                fontSize: AppConstants.kFontSizeXS,
                              ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Genre: ${widget.comic.genre}',
                                style: const TextStyle(
                                  fontSize: AppConstants.kFontSizeS,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.favorite_border_outlined,
                                      color: UIColors.white,
                                      size: 26,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15.0,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.share_outlined,
                                      color: UIColors.white,
                                      size: 26,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'Synopsis',
                style: TextStyle(
                  color: UIColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: AppConstants.kFontSizeL,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Container(
                constraints: const BoxConstraints(
                  maxHeight: 200,
                ),
                child: SingleChildScrollView(
                  child: Text(
                    widget.comic.sinopsis!,
                  ),
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              const Text(
                'List Chapters',
                style: TextStyle(
                  color: UIColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: AppConstants.kFontSizeL,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: UIColors.grey_80,
                  borderRadius: BorderRadius.circular(8),
                ),
                constraints: const BoxConstraints(
                  maxHeight: 300,
                ),
                child: BlocBuilder<ComicDetailBloc, ComicDetailState>(
                  builder: (context, state) {
                    if (state is ComicDetailFailed) {
                      print(state.e);
                    }
                    if (state is ComicDetailSuccess) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.datas.length,
                        itemBuilder: (context, index) {
                          return ChapterTile(
                            item: state.datas[index],
                            comic: widget.comic,
                          );
                        },
                      );
                    }

                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
