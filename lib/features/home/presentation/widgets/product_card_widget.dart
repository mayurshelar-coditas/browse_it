// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:browse_it/core/constants/constants.dart';
import 'package:browse_it/core/theme/app_pallete.dart';
import 'package:browse_it/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductModel product;

  const ProductCardWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppPallete.whiteColor,
      child: Column(
        children: [
          Center(
            child: Expanded(
              child: Image.network(
                product.image,
                height: Constants.imageHeight,
                width: Constants.imageWidth,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.all(12.dm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: GoogleFonts.roboto(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 10.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rating: ${product.rating.rate}',
                          style: GoogleFonts.roboto(fontSize: 15.sp),
                        ),
                        Text('Count: ${product.rating.count}'),
                      ],
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      'Price: \$ ${product.price}',
                      textAlign: TextAlign.end,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
