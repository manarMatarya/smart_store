import 'package:get/get.dart';
import 'package:smart_store/api/address_api_controller.dart';
import 'package:smart_store/models/address.dart';
import 'package:smart_store/models/process_response.dart';

class AddressGetxController extends GetxController {
  RxList<Address> addresses = <Address>[].obs;
  RxBool isLoading = false.obs;
  final AddressApiController _controller = AddressApiController();

  static AddressGetxController get to => Get.find<AddressGetxController>();

  @override
  void onInit() {
    getAddresses();
    super.onInit();
  }

  getAddresses() async {
    isLoading.value = true;
    addresses.value = await _controller.getAddresses();
    isLoading.value = false;
  }

  addAddress({required Address address}) async {
    bool created = await _controller.addAddress(address: address);
    return ProcessResponse(
      message:
          created ? 'Operation completed successfully' : 'Operation failed!',
      success: true,
    );
  }
}
