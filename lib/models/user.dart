import 'package:smart_store/models/city.dart';

class User {
  late int id;
  late String name;
  String? email;
  late String mobile;
  late String cityId;
  late String gender;
  late String password;
  late String token;
  late City city;

  static const String tableName = 'users';

  User();

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    gender = json['gender'];
    cityId = json['city_id'];
    token = json['token'];
    city = City.fromJson(json['city']);
  }
}
