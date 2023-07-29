// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:eroi_desu/src/data/models/chapter_model.dart';
import 'package:eroi_desu/src/data/models/comic_model.dart';
import 'package:eroi_desu/src/features/comic_chapter/view/comic_chapter_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../../config/constant.dart';
import '../../../config/theme/colors.dart';

class ChapterTile extends StatefulWidget {
  final ComicModel comic;
  final ChapterModel item;
  const ChapterTile({Key? key, required this.item, required this.comic})
      : super(key: key);

  @override
  State<ChapterTile> createState() => _ChapterTileState();
}

class _ChapterTileState extends State<ChapterTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => pushDynamicScreen(
        context,
        screen: PageTransition(
          child: ComicChapterPage(comic: widget.comic, chapter: widget.item),
          type: PageTransitionType.rightToLeft,
        ),
        withNavBar: false,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        margin: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          color: UIColors.grey_100,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.item.chapter!,
              style: const TextStyle(
                fontSize: AppConstants.kFontSizeL,
                fontWeight: FontWeight.w500,
                color: UIColors.grey_20,
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: UIColors.grey_20,
            )
          ],
        ),
      ),
    );
  }
}
