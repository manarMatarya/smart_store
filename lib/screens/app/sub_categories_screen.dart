import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/utils/colors.dart';
import 'package:smart_store/widgets/app/custom_product.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    final List _products = [
      {'name': 'Fruits', 'image': 'images/food1.png'},
      {'name': 'Cake', 'image': 'images/food4.png'},
      {'name': 'Desserts', 'image': 'images/food5.png'},
      {'name': 'Donut', 'image': 'images/food3.png'},
      {'name': 'Apple', 'image': 'images/food6.png'},
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          name,
          style: GoogleFonts.montserrat(
            color: mainFontColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 10.h,
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _products.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return CustomProduct(
            image: _products[index]['image'],
            name: _products[index]['name'],
          );
        },
      ),
    );
  }
}
