import 'package:get/get.dart';

import '../controller/product_controller.dart';
import '../controller/single_product_controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductController());
    Get.lazyPut(() => SingleProductController());
  }
}
