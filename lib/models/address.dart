import 'package:smart_store/models/city.dart';

class Address {
  late int id;
  late String name;
  late String info;
  late String contactNumber;
  late int cityId;
  late City city;

  Address();

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    info = json['info'];
    contactNumber = json['contact_number'];
    cityId = json['city_id'];
    city = City.fromJson(json['city']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['info'] = info;
    data['contact_number'] = contactNumber;
    data['city_id'] = cityId;

    data['city'] = city.toJson();

    return data;
  }
}
