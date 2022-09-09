import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:smart_store/api/api_settings.dart';
import 'package:smart_store/models/api_response.dart';
import 'package:smart_store/models/city.dart';
import 'package:smart_store/models/user.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';
import 'package:smart_store/utils/helpers.dart';

class AuthApiController with ApiHelpers {
  Future<ApiResponse> login(
      {required String mobile, required String password}) async {
    Uri uri = Uri.parse(ApiSettings.login);
    http.Response response = await http.post(uri, body: {
      'mobile': mobile,
      'password': password,
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        User user = User.fromJson(json['data']);
        SharedPrefController().save(user: user);
      }
      return ApiResponse(json['message'], json['status']);
    } else {
      return errorResponse;
    }
  }

  Future<ApiResponse> register({required User user}) async {
    Uri uri = Uri.parse(ApiSettings.register);
    http.Response response = await http.post(uri, body: {
      'name': user.name,
      'email': user.email,
      'mobile': user.mobile,
      'city_id': user.cityId,
      'gender': user.gender,
      'password': user.password,
      'STORE_API_KEY': 'cc57641f-7ed0-4f22-93bf-fb23b637c0e0',
      'city': jsonEncode(user.city),
    });
    if (response.statusCode == 201 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      if (response.statusCode == 201) {
        int verificationCode = json['code'];
        return ApiResponse(verificationCode.toString(), json['status']);
      }
      return ApiResponse(json['message'], json['status']);
    } else {
      return errorResponse;
    }
  }

  Future<ApiResponse> logout() async {
    String token =
        SharedPrefController().getValueFor<String>(PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiSettings.logout);
    http.Response response = await http.get(uri, headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: token,
    });
    if (response.statusCode == 200 || response.statusCode == 401) {
      SharedPrefController().clear;
      return ApiResponse('Logged out Successfully', true);
    } else {
      return errorResponse;
    }
  }

  Future<ApiResponse> activate(
      {required int code, required String mobile}) async {
    Uri uri = Uri.parse(ApiSettings.activate);
    print('#############');
    print(code.runtimeType);
    http.Response response = await http.post(uri, body: {
      'mobile': mobile,
      'code': code.toString(),
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return ApiResponse(json['message'], json['status']);
    } else {
      return errorResponse;
    }
  }
}
