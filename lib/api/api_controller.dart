import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:smart_store/api/api_settings.dart';
import 'package:smart_store/models/address.dart';
import 'package:smart_store/models/category.dart';
import 'package:smart_store/models/city.dart';
import 'package:smart_store/models/images.dart';
import 'package:smart_store/models/product.dart';
import 'package:smart_store/models/sub_category.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';
import 'package:smart_store/utils/helpers.dart';

class ApiController with ApiHelpers {
  Map<String, String> headers = {
    HttpHeaders.authorizationHeader:
        SharedPrefController().getValueFor(PrefKeys.token.name) ?? '',
    HttpHeaders.acceptHeader: 'application/json',
  };
  Future<List<City>> getCities() async {
    Uri uri = Uri.parse(ApiSettings.cities);
    http.Response response = await http.get(uri, headers: {
      HttpHeaders.acceptHeader: 'application/json',
    });
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var dataJsonObject = json['list'] as List;
      return dataJsonObject.map((json) => City.fromJson(json)).toList();
    }
    return [];
  }

  Future<List<Category>> getCategories() async {
    var url = Uri.parse(ApiSettings.categories.replaceAll('/{id}', ''));
    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['list'] as List;
      List<Category> categories =
          data.map((e) => Category.fromJson(e)).toList();
      return categories;
    }
    return [];
  }

  Future<List<SubCategory>> getSubCategories({required String id}) async {
    var url = Uri.parse(ApiSettings.categories.replaceAll('{id}', id));

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['list'] as List;
      List<SubCategory> categories =
          data.map((e) => SubCategory.fromJson(e)).toList();

      return categories;
    }
    return [];
  }

  Future<List<Product>> getProducts({required String id}) async {
    var url = Uri.parse(ApiSettings.products.replaceAll('{id}', id));
    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['list'] as List;

      List<Product> products = data.map((e) => Product.fromJson(e)).toList();
      return products;
    }
    return [];
  }

  Future<List<Images>> getProductDetails({required String id}) async {
    var url = Uri.parse(ApiSettings.productDetails.replaceAll('{id}', id));
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['object']['images'] as List;
      List<Images> images = data.map((e) => Images.fromJson(e)).toList();
      return images;
    }
    return [];
  }

}
