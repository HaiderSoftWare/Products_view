import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../controller/single_product_controller.dart';
import '../shared/constant/const.dart';
import '../shared/widget/custom_button.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key});

  final controller = Get.find<SingleProductController>();
  final controllerPage = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          return controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //Title Product
                    AppBar(
                      backgroundColor: kPrimaryColor,
                      elevation: 0,
                      centerTitle: true,
                      actions: [
                        Padding(
                          padding: EdgeInsets.only(right: 2.w),
                          child: Icon(
                            Icons.search,
                            size: 7.w,
                          ),
                        ),
                      ],
                    ),

                    //Slider Image

                    Center(
                      child: Hero(
                        tag: '${controller.product.value.id}',
                        child: Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: SizedBox(
                            width: 90.w,
                            height: 25.h,
                            child: PageView.builder(
                              controller: controllerPage,
                              itemCount:
                                  controller.product.value.images!.length,
                              itemBuilder: (context, index) {
                                return Stack(
                                  children: [
                                    Center(
                                      child: Lottie.asset(
                                          'asset/lottile/loading.json'),
                                    ),

                                    // Fade Image
                                    Center(
                                      child: FadeInImage.memoryNetwork(
                                        placeholder: kTransparentImage,
                                        image: controller
                                            .product.value.images![index],
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),

                    //For Pointer of Images

                    Center(
                      child: SmoothPageIndicator(
                          controller: controllerPage, // PageController
                          count: controller.product.value.images!.length,
                          effect: WormEffect(
                              dotWidth: 12,
                              dotHeight: 12,
                              dotColor: Colors.grey.withOpacity(0.4),
                              activeDotColor:
                                  kPrimaryColor), // your preferred effect

                          onDotClicked: (index) {}),
                    ),

                    SizedBox(
                      height: 4.h,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: kDefaultPadding * 1,
                        horizontal: kDefaultPadding * 1,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //Title Products
                          Text(
                            controller.product.value.title.toString(),
                            style: CustomTextStyle(
                                fontsize: 20.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          //Row of Porduct Brand And Price
                          Text(
                            '\$${controller.product.value.price}',
                            style: CustomTextStyle(
                              fontsize: 16.sp,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            'Brand : ${controller.product.value.brand}',
                            style: CustomTextStyle(
                              fontsize: 18.sp,
                              color: Colors.black.withOpacity(0.8),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          // Porduct Category
                          Text(
                            'Category : ${controller.product.value.category}',
                            style: CustomTextStyle(
                              fontsize: 18.sp,
                              color: Colors.black.withOpacity(0.8),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          // Porduct Description
                          Text(
                            controller.product.value.description.toString(),
                            style: CustomTextStyle(
                              fontsize: 16.sp,
                              color: kTextLightColor,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Add to Cart Button
                    Padding(
                      padding: EdgeInsets.only(top: 3.h, left: 4.w, right: 4.w),
                      child: Custom_Button(
                        text: 'Add to cart',
                        onpress: () {},
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
