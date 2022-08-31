import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/utils/colors.dart';
import 'package:smart_store/widgets/app/custom_product.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List _products = [
      {'name': 'Fruits', 'image': 'images/food1.png'},
      {'name': 'Cake', 'image': 'images/food4.png'},
      {'name': 'Desserts', 'image': 'images/food5.png'},
      {'name': 'Donut', 'image': 'images/food3.png'},
      {'name': 'Apple', 'image': 'images/food6.png'},
      {'name': 'Fruits', 'image': 'images/food1.png'},
      {'name': 'Cake', 'image': 'images/food4.png'},
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Favorite Products',
          style: GoogleFonts.montserrat(
            color: mainFontColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20.w,
          crossAxisSpacing: 20.h,
           childAspectRatio: 160.h / 180.w,
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
