import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/get/categorey_getx_controller.dart';
import 'package:smart_store/get/products_getx_controller.dart';
import 'package:smart_store/models/category.dart';
import 'package:smart_store/screens/app/product_info.dart';
import 'package:smart_store/utils/colors.dart';
import 'package:smart_store/widgets/app/custom_product.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key, required this.category}) : super(key: key);
  final Category category;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  CategoryGetxController categoryGetxController = CategoryGetxController.to;
  ProductsGetxController productsGetxController = ProductsGetxController.to;

  int selectedItem = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.category.nameEn,
          style: GoogleFonts.montserrat(
            color: mainFontColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: mainFontColor,
          ),
        ),
      ),
      body: Obx(() {
        return (categoryGetxController.isLoading.value ||
                productsGetxController.isLoading.value)
            ? const Center(
                child: CircularProgressIndicator(
                  color: mainColor,
                ),
              )
            : ListView(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 30.w),
                    height: 110.h,
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: categoryGetxController.subCategories.length,
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 16.w,
                        crossAxisSpacing: 16.h,
                        childAspectRatio: 110.h / 70.w,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              setState(() {
                                selectedItem = index;

                                productsGetxController.getProducts(
                                  id: categoryGetxController
                                      .subCategories[index].id
                                      .toString(),
                                );
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 10.h),
                                  width: 60.w,
                                  height: 60.h,
                                  decoration: BoxDecoration(
                                    color: selectedItem == index
                                        ? mainColor
                                        : greyColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16.r),
                                      bottomLeft: Radius.circular(16.r),
                                      bottomRight: Radius.circular(16.r),
                                    ),
                                  ),
                                  child: Image.network(categoryGetxController
                                      .subCategories[index].imageUrl),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  categoryGetxController
                                      .subCategories[index].nameEn,
                                  style: GoogleFonts.montserrat(
                                    color: selectedItem == index
                                        ? mainColor
                                        : greyColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ));
                      },
                    ),
                  ),
                  GridView.builder(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.w),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20.w,
                      crossAxisSpacing: 20.h,
                      childAspectRatio: 160.h / 180.w,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: productsGetxController.products.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) => ProductInfoScreen(
                                            currentProduct:
                                                productsGetxController
                                                    .products[index],
                                          )),
                                    ),
                                  ),
                        child: CustomProduct(
                          image:
                              productsGetxController.products[index].imageUrl,
                          name: productsGetxController.products[index].nameEn,
                        ),
                      );
                    },
                  ),
                ],
              );
      }),
    );
  }
}
