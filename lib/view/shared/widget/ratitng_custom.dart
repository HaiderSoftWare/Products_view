import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({
    super.key,
    required this.rating,
    required this.runtimeType,
  });

  final rating;
  @override
  final Type runtimeType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 3.w),
      child: RatingBarIndicator(
        rating: rating!.runtimeType == int ? rating + .0 : rating,
        itemBuilder: (context, index) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        itemSize: 20.0,
        direction: Axis.horizontal,
      ),
    );
  }
}
