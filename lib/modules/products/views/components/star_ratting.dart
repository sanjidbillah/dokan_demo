import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double averageRating;
  final double starSize;
  final Color filledStarColor;
  final Color emptyStarColor;

  const StarRating({
    super.key,
    required this.averageRating,
    this.starSize = 14,
    this.filledStarColor = const Color(0xFFF5A623),
    this.emptyStarColor = const Color(0xFFD3D8E5),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < averageRating) {
          return Icon(
            Icons.star,
            size: starSize,
            color: filledStarColor,
          );
        } else if (index < averageRating + 0.5) {
          return Icon(
            Icons.star_half,
            size: starSize,
            color: filledStarColor,
          );
        } else {
          return Icon(
            Icons.star,
            size: starSize,
            color: emptyStarColor,
          );
        }
      }),
    );
  }
}
