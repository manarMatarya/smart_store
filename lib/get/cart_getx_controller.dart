import 'package:get/get.dart';
import 'package:smart_store/database/controllers/cart_db_controller.dart';
import 'package:smart_store/models/cart.dart';
import 'package:smart_store/models/process_response.dart';

class CartGetxController extends GetxController {
  RxList<Cart> cartItems = <Cart>[].obs;
  RxList cartOrder = [].obs;
  RxBool loading = false.obs;

  static CartGetxController get to => Get.find<CartGetxController>();

  @override
  void onInit() {
    read();
    super.onInit();
  }

  final CartDbController _dbController = CartDbController();
  double total = 0;
  double quantity = 0;

  Future<ProcessResponse> create(Cart cart) async {
    int index =
        cartItems.indexWhere((element) => element.productId == cart.productId);
    if (index == -1) {

      int newRowId = await _dbController.create(cart);
      if (newRowId != 0) {
        total += cart.total;
        quantity += 1;
        cart.id = newRowId;
        cartItems.add(cart);
      }
      return getResponse(newRowId != 0);
    } else {
      int newCount = cartItems[index].count + 1;
      return changeQuantity(index, newCount);
    }
  }

  void read() async {
    loading.value = true;
    cartItems.value = await _dbController.read();
    for (Cart cart in cartItems) {
      total += cart.total;
      quantity += cart.count;
    }
    loading.value = false;
  }

  void readCartOrder() async {
    cartOrder.value = await _dbController.read();
    for (Cart cart in cartItems) {
      cartOrder.add({'product_id': cart.productId, 'quantity': cart.count});
    }
  }

  Future<ProcessResponse> changeQuantity(int index, int count) async {
    bool isDelete = count == 0;
    Cart cart = cartItems[index];
    bool result = isDelete
        ? await _dbController.delete(cart.id)
        : await _dbController.update(cart);

    if (result) {
      if (isDelete) {
        total -= cart.total;
        quantity -= 1;
        cartItems.removeAt(index);
      } else {
        cart.count = count;
        cart.total = cart.price * cart.count;
        total += cart.total;
        quantity += 1;
        cartItems[index] = cart;
      }
    }

    return getResponse(result);
  }

  Future<ProcessResponse> clear() async {
    bool cleared = await _dbController.clear();
    if (cleared) {
      total = 0;
      quantity = 0;
      cartItems.clear();
    }
    return getResponse(cleared);
  }

  ProcessResponse getResponse(bool success) {
    return ProcessResponse(
      message:
          success ? 'Operation completed successfully' : 'Operation failed!',
      success: success,
    );
  }
}
