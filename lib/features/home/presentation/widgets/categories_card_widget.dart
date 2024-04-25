import 'package:browse_it/core/theme/app_pallete.dart';
import 'package:browse_it/features/home/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoeriesCardWidget extends StatelessWidget {
  const CategoeriesCardWidget({
    super.key,
    required this.categoryEntity,
  });

  final CategoryEntity categoryEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0.dm),
      child: Card(
        color: AppPallete.blackColor,
        elevation: 10.dm,
        child: Center(
          child: Text(
            categoryEntity.name,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              color: AppPallete.whiteColor,
              fontSize: 25.sp,
            ),
          ),
        ),
      ),
    );
  }
}
