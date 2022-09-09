import 'package:get/get.dart';
import 'package:smart_store/api/api_controller.dart';
import 'package:smart_store/models/category.dart';
import 'package:smart_store/models/sub_category.dart';

class CategoryGetxController extends GetxController {
  RxList<Category> categories = <Category>[].obs;
  RxList<SubCategory> subCategories = <SubCategory>[].obs;
  RxString subCategoryId = ''.obs;

  RxBool isLoading = false.obs;

  final ApiController _controller = ApiController();

  static CategoryGetxController get to => Get.find<CategoryGetxController>();

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  getCategories() async {
    isLoading.value = true;
    categories.value = await _controller.getCategories();
    isLoading.value = false;
  }

  getSubCategories({required String id}) async {
    isLoading.value = true;

    subCategories.value = await _controller.getSubCategories(id: id);
    subCategoryId.value = subCategories[0].id.toString();

    isLoading.value = false;
  }
}
