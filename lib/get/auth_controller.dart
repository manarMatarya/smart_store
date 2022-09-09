import 'package:get/get.dart';
import 'package:smart_store/api/api_controller.dart';
import 'package:smart_store/models/city.dart';

class AuthGetxController extends GetxController {
  RxList<City> cities = <City>[].obs;
  RxBool isLoading = false.obs;
  final ApiController _controller = ApiController();


  static AuthGetxController get to => Get.find<AuthGetxController>();

  @override
  void onInit() {
    getCities();
    super.onInit();
  }
  getCities() async {
    isLoading.value = true;
    cities.value = await _controller.getCities();
    isLoading.value = false;
  }
}
