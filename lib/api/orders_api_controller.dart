import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:smart_store/api/api_settings.dart';
import 'package:smart_store/models/api_response.dart';
import 'package:smart_store/models/cart.dart';
import 'package:smart_store/models/order.dart';
import 'package:smart_store/models/process_response.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';
import 'package:smart_store/utils/helpers.dart';

class OrdersApiController with ApiHelpers {
  Map<String, String> headers = {
    HttpHeaders.authorizationHeader:
        SharedPrefController().getValueFor(PrefKeys.token.name) ?? '',
    HttpHeaders.acceptHeader: 'application/json',
  };

  Future<List<Order>> getOrders() async {
    var url = Uri.parse(ApiSettings.orders.replaceAll('/{id}', ''));
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['list'] as List;
      List<Order> orders = data.map((e) => Order.fromJson(e)).toList();
      return orders;
    }
    return [];
  }

  Future<bool> addOrder(
      {required List cart,
      required String paymentType,
      required String addressId}) async {
    Uri uri = Uri.parse(ApiSettings.orders.replaceAll('/{id}', ''));

    http.Response response = await http.post(
      uri,
      body: {
        'cart': cart.toString().replaceAll(' ', ''),
        'payment_type': paymentType.toString(),
        'address_id': addressId.toString(),
      },
      headers: headers,
    );
    print('#############');
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return json['status'];
      } else {
        return json['status'];
      }
    } else {
      return false;
    }
  }

  Future<Order> getOrderDetails({required String id}) async {
    var url = Uri.parse(ApiSettings.orders.replaceAll('{id}', id));
    var response = await http.get(url, headers: headers);
    Order order = Order();
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      order = Order.fromJson(data);
      return order;
    }
    return order;
  }
}
