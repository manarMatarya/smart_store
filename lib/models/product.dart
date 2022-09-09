class Product {
  late int id;
  late String nameEn;
  late String nameAr;
  late String infoEn;
  late String infoAr;
  late String price;
  late String quantity;
  late String subCategoryId;
  late int productRate;
  late String imageUrl;

  Product();

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    infoEn = json['info_en'];
    infoAr = json['info_ar'];
    price = json['price'];
    quantity = json['quantity'];
    subCategoryId = json['sub_category_id'];
    productRate = json['product_rate'];
    imageUrl = json['image_url'];
  }
}
