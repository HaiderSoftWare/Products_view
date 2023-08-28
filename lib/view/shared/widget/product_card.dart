import 'package:flutter/material.dart';
import 'package:products_view/view/shared/widget/ratitng_custom.dart';
import 'package:sizer/sizer.dart';
import 'package:transparent_image/transparent_image.dart';

import '../constant/const.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    super.key,
    this.itemIndex,
    this.press,
    this.title,
    this.id,
    this.image,
    this.price,
    this.rating,
  });

  final int? itemIndex;
  int? id;
  String? title;
  int? price;
  String? image;
  dynamic rating;

  void Function()? press;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 1,
        vertical: 2,
      ),
      height: 160,
      child: InkWell(
        onTap: press,
        child: Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          fit: StackFit.passthrough,
          children: <Widget>[
            // Those are our background
            Container(
              height: 136,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: kPrimaryColor,
                boxShadow: const [kDefaultShadow],
              ),
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ),
            // our product image
            Positioned(
              top: 0,
              right: 0,
              child: Hero(
                tag: '$id',
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  height: 160,
                  width: 200,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      const Center(
                          child: CircularProgressIndicator(
                        color: kPrimaryColor,
                      )),
                      FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: image!,
                        fit: BoxFit.fitHeight,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Product title
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                height: 136,
                // our image take 200 width, thats why we set out total width - 200
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: Text(
                        title!,
                        style: CustomTextStyle(
                            fontsize: 4.5.w, color: Colors.black),
                      ),
                    ),

                    const Spacer(),
                    // This For Rating
                    RateWidget(
                        rating: rating,
                        runtimeType: runtimeType), // end of rating
                    const Spacer(),

                    // Product price
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding * 1.5, // 30 padding
                        vertical: kDefaultPadding / 4, // 5 top and bottom
                      ),
                      decoration: const BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(22),
                          topRight: Radius.circular(22),
                        ),
                      ),
                      child: Text(
                        "\$$price",
                        style: CustomTextStyle(
                            fontsize: 4.5.w, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
