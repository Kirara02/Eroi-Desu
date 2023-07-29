import 'package:flutter/material.dart';

import '../../../config/constant.dart';
import '../../../config/theme/colors.dart';

class CarouselItem extends StatefulWidget {
  final Map<String, dynamic> anime;

  const CarouselItem({super.key, required this.anime});

  @override
  _CarouselItemState createState() => _CarouselItemState();
}

class _CarouselItemState extends State<CarouselItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.anime['judul'].toString().toUpperCase(),
                  style: const TextStyle(
                    fontSize: AppConstants.kFontSizeXL,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2.0),
                Text(
                  widget.anime['genre'].join(', '),
                  style: const TextStyle(
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
                  widget.anime['sinopsis'],
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
                widget.anime['img_url'].toString(),
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
