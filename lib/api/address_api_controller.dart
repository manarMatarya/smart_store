import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:smart_store/api/api_settings.dart';
import 'package:smart_store/models/address.dart';
import 'package:smart_store/models/city.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';
import 'package:smart_store/utils/helpers.dart';

class AddressApiController with ApiHelpers {
  Map<String, String> headers = {
    HttpHeaders.authorizationHeader:
        SharedPrefController().getValueFor(PrefKeys.token.name) ?? '',
    HttpHeaders.acceptHeader: 'application/json',
  };

  Future<List<Address>> getAddresses() async {
    var url = Uri.parse(ApiSettings.addresses.replaceAll('/{id}', ''));
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['list'] as List;
      List<Address> addresses = data.map((e) => Address.fromJson(e)).toList();
      return addresses;
    }
    return [];
  }

  Future addAddress({required Address address}) async {
    Uri uri = Uri.parse(ApiSettings.addresses.replaceAll('/{id}', ''));

    http.Response response = await http.post(
      uri,
      body: {
        'name': address.name,
        'info': address.info,
        'contact_number': address.contactNumber,
        'city_id': address.city.id.toString(),
      },
      headers: headers,
    );
    if (response.statusCode == 201 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      if (response.statusCode == 201) {
        return json['status'];
      }
      return json['status'];
    } else {
      return errorResponse;
    }
  }

  // Future<ApiResponse> updateAddress({required String id}) async {
  //   Uri uri = Uri.parse(ApiSettings.addresses.replaceAll('{id}', id));
  //   http.Response response = await http.post(uri, body: {
  //     'name': address.name,
  //     'info': address.info,
  //     'contact_number': address.contactNumber,
  //     'city_id': address.city.id,
  //   });
  //   if (response.statusCode == 201 || response.statusCode == 400) {
  //     var json = jsonDecode(response.body);
  //     if (response.statusCode == 201) {
  //       return ApiResponse(json['message'], json['status']);
  //     }
  //     return ApiResponse(json['message'], json['status']);
  //   } else {
  //     return errorResponse;
  //   }
  // }
}
