import 'package:get/get.dart';
import 'package:products_view/model/single_product.dart';

import '../service/api.dart';

class SingleProductController extends GetxController {
  // Loading When get Products
  RxBool isLoading = false.obs;
  var product = SingleProductModel().obs;

  //  Get Single Products
  void getOneProducts({int? id}) async {
    try {
      isLoading(true);
      final response = await Api.getOneProduct(id: id);

      product.value = SingleProductModel.fromJson(response.data);

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
}
