import 'package:get/get.dart';
import 'package:smart_store/api/orders_api_controller.dart';
import 'package:smart_store/models/cart.dart';
import 'package:smart_store/models/order.dart';
import 'package:smart_store/models/process_response.dart';

class OrdersGetxController extends GetxController {
  RxList<Order> orders = <Order>[].obs;
  RxString addressId = ''.obs;
  RxString paymentType = ''.obs;
  RxBool isLoading = false.obs;
  final OrdersApiController _controller = OrdersApiController();

  static OrdersGetxController get to => Get.find<OrdersGetxController>();

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }

  getOrders() async {
    isLoading.value = true;
    orders.value = await _controller.getOrders();
    isLoading.value = false;
  }

  Future<ProcessResponse> addOrder({
    required List carts,
  }) async {
    bool created = await _controller.addOrder(
        cart: carts,
        paymentType: paymentType.value,
        addressId: addressId.value);
    return ProcessResponse(
      message:
          created ? 'Operation completed successfully' : 'Operation failed!',
      success: created,
    );
  }
}
