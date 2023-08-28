import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:products_view/controller/single_product_controller.dart';
import 'package:products_view/view/screen/details_screen.dart';
import 'package:products_view/view/shared/constant/const.dart';
import 'package:sizer/sizer.dart';

import '../../controller/product_controller.dart';
import '../../model/catergory.dart';
import '../../model/loading_type.dart';
import '../shared/widget/product_card.dart';
import '../shared/widget/search_box.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(ProductController());
  final controllerSingle = Get.put(SingleProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            //Search
            SearchBox(
              controller: controller.searchController,
              onChanged: (value) {
                controller.searchProduct();
              },
            ),
            Obx(() {
              final loadingType = controller.loadingState.value.loadingType;

              if (controller.isLoading.value) {
                return Center(
                  child: Lottie.asset('asset/lottile/loading.json'),
                );
              }
              if (controller.products.value.products!.isEmpty) {
                return const Text("No Data");
              }
              return Container(
                width: 100.w,
                height: 79.h,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 9.w, vertical: 1.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // For Category
                            Category()
                          ],
                        ),
                      ),
                    ),
                    //List Of Products
                    Expanded(
                      flex: 14,
                      child: ListView.builder(
                        shrinkWrap: false,
                        itemCount: controller.products.value.products!.length,
                        controller: controller.scrollController,
                        itemBuilder: (context, index) {
                          final isLastItem = index ==
                              controller.products.value.products!.length;

                          if (isLastItem &&
                              loadingType == LoadingType.loading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (isLastItem &&
                              loadingType == LoadingType.error) {
                            return Text(
                                controller.loadingState.value.error.toString());
                          } else if (isLastItem &&
                              loadingType == LoadingType.completed) {
                            return Text(controller.loadingState.value.completed
                                .toString());
                          } else {
                            // on tap card navigate to detaills screen
                            return GestureDetector(
                              onTap: () {
                                controllerSingle.getOneProducts(
                                    id: controller
                                        .products.value.products![index].id);
                                Get.to(DetailsScreen());
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                // Prodtuct Card
                                child: ProductCard(
                                  title: controller
                                      .products.value.products![index].title,
                                  id: controller
                                      .products.value.products![index].id,
                                  price: controller
                                      .products.value.products![index].price,
                                  image: controller.products.value
                                      .products![index].images![0],
                                  rating: controller
                                      .products.value.products![index].rating,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Expanded Category() {
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              controller.getByCategory(category: categories[index].name);
              categories[index].stateColor = !categories[index].stateColor!;
            },
            child: Container(
              width: 32.w,
              height: 5.h,
              decoration: BoxDecoration(
                color:
                    categories[index].stateColor! ? kPrimaryColor : Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  categories[index].name.toString(),
                  style: CustomTextStyle(
                    color: Colors.white,
                    fontsize: 20,
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Padding(padding: EdgeInsets.all(10));
        },
      ),
    );
  }
}
