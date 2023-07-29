import 'package:eroi_desu/src/config/constant.dart';
import 'package:eroi_desu/src/data/models/comic_model.dart';
import 'package:eroi_desu/src/features/comic_detail/view/comic_detail_page.dart';
import 'package:eroi_desu/src/widgets/images/cached_network.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class ComicCard extends StatelessWidget {
  final ComicModel comic;

  const ComicCard({
    super.key,
    required this.comic,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushDynamicScreen(context,
            screen: PageTransition(
                child: ComicDetailPage(
                  comic: comic,
                ),
                type: PageTransitionType.rightToLeft),
            withNavBar: false);
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: UICacheNetworkImage(
                imageUrl: comic.cover!,
                fit: BoxFit.cover,
                size: const Size.fromHeight(100),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 6.0,
                horizontal: 2.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comic.title!,
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: AppConstants.kFontSizeM,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    comic.genre!,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: AppConstants.kFontSizeXS,
                      color: Colors.grey,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
