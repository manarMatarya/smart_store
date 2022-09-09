import 'package:get/get.dart';
import 'package:smart_store/api/api_controller.dart';
import 'package:smart_store/models/images.dart';
import 'package:smart_store/models/product.dart';

class ProductsGetxController extends GetxController {
  RxList<Product> products = <Product>[].obs;
  RxList<Product> latestProducts = <Product>[].obs;
  RxList<Product> likeProducts = <Product>[].obs;
  RxList<Images> images = <Images>[].obs;

  RxBool isLoading = false.obs;
  final ApiController _controller = ApiController();

  static ProductsGetxController get to => Get.find<ProductsGetxController>();

  @override
  void onInit() {
    getProducts(id: '1396');
    getLatestProducts(id: '1398');
    getLikeProducts(id: '1397');
    super.onInit();
  }

  getProducts({required String id}) async {
    isLoading.value = true;
    products.value = await _controller.getProducts(id: id);
    isLoading.value = false;
  }

  getLatestProducts({required String id}) async {
    isLoading.value = true;
    latestProducts.value = await _controller.getProducts(id: id);
    isLoading.value = false;
  }

  getLikeProducts({required String id}) async {
    isLoading.value = true;
    likeProducts.value = await _controller.getProducts(id: id);
    isLoading.value = false;
  }

  getProductDetails({required String id}) async {
    isLoading.value = true;
    images.value = await _controller.getProductDetails(id: id);
    isLoading.value = false;
  }
}
