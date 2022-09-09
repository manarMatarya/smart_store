class Cart {
  late int id;
  late double total;
  late double price;
  late int count;
  late int userId;
  late int productId;
  late String productName;
  late String image;

  static const String tableName = 'cart';

  Cart();

  Cart.fromMap(Map<String, dynamic> rowMap) {
    id = rowMap['id'];
    total = rowMap['total'];
    price = rowMap['price'];
    count = rowMap['count'];
    userId = rowMap['user_id'];
    productId = rowMap['product_id'];
    productName = rowMap['product_name'];
    image = rowMap['image'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['total'] = total;
    map['price'] = price;
    map['count'] = count;
    map['user_id'] = userId;
    map['product_id'] = productId;
    map['product_name'] = productName;
    map['image'] = image;
    return map;
  }
}
