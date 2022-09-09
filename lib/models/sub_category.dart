class SubCategory {
  late int id;
  late String nameEn;
  late String nameAr;
  late String categoryId;
  late String image;
  late String productsCount;
  late String imageUrl;

  SubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    categoryId = json['category_id'];
    image = json['image'];
    productsCount = json['products_count'];
    imageUrl = json['image_url'];
  }
}
