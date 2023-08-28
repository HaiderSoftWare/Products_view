import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_view/model/product.dart';

import '../service/api.dart';
import '../model/loading_state.dart';
import '../model/loading_type.dart';

class ProductController extends GetxController {
  // Loading When get Products
  RxBool isLoading = false.obs;
  // Loading When get Products From Search
  RxBool isLoadingSearch = false.obs;
  // Scroll Controller
  final scrollController = ScrollController();
  // Search Controller
  final searchController = TextEditingController();

  final loadingState = LoadingState(loadingType: LoadingType.stable).obs;

  // For Pagination
  int limitNumber = 10;

  var products = ProductModel().obs;

  // First Method Running When Contoller is Injection
  @override
  void onInit() {
    getProducts();
    scrollController.addListener(_scrollListener);
    super.onInit();
  }

  //  Get Products
  void getProducts() async {
    try {
      isLoading(true);
      final response = await Api.getProducts(limit: limitNumber);

      products.value = ProductModel.fromJson(response.data);

      isLoading(false);
    } catch (e) {
      isLoading(false);
      Get.snackbar(
        'Error',
        'This Error is $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // When Scroll is End Get Next Product Item
  void _scrollListener() async {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      loadingState.value = LoadingState(loadingType: LoadingType.loading);
      try {
        await Future.delayed(const Duration(seconds: 0));
        final listOfData =
            await Api.getProducts(limit: limitNumber = limitNumber + 10);

        if (listOfData.data == null) {
          loadingState.value = LoadingState(
              loadingType: LoadingType.completed,
              completed: "there is no data");
        } else {
          products.value = ProductModel.fromJson(listOfData.data);
          loadingState.value = LoadingState(loadingType: LoadingType.loaded);
        }
      } catch (err) {
        loadingState.value =
            LoadingState(loadingType: LoadingType.error, error: err.toString());
      }
    }
  }

// For Search Products
  void searchProduct() async {
    try {
      isLoadingSearch(true);
      final response = await Api.searchProducts(keyword: searchController.text);
      products.value.products!.clear();
      products.value = ProductModel.fromJson(response.data);
      isLoadingSearch(false);
    } catch (e) {
      print('Error in Search');
    }
  }

  // For get Products By Category
  void getByCategory({String? category}) async {
    try {
      isLoadingSearch(true);
      final response = await Api.getByCategory(category: category);
      products.value.products!.clear();
      products.value = ProductModel.fromJson(response.data);
      isLoadingSearch(false);
    } catch (e) {
      print('Error in Search');
    }
  }
}
